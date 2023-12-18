import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sport_news/data/basketball_datasource.dart';
import 'package:sport_news/data/enum/sport_type.dart';
import 'package:sport_news/data/football_datasource.dart';
import 'package:sport_news/data/hockey_datasource.dart';
import 'package:sport_news/data/models/match.dart';
import 'package:sport_news/widgets/custom_app_bar.dart';
import 'package:sport_news/widgets/custom_tab.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  DateTime _selectedDay = DateTime.now();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this)
      ..addListener(_tabListener);
  }

  void _tabListener() => setState(() {});

  @override
  void dispose() {
    _tabController.removeListener(_tabListener);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, value) => [
        SliverAppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: const CustomAppBar(
            title: 'Calendar',
          ),
          pinned: true,
        ),
        SliverAppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          pinned: true,
          title: TabBar(
            indicatorColor: Theme.of(context).scaffoldBackgroundColor,
            dividerColor: Theme.of(context).scaffoldBackgroundColor,
            controller: _tabController,
            tabs: [
              Tab(
                child: CustomTab(
                  icon: 'assets/football_ball.png',
                  text: 'Football',
                  isSelected: _tabController.index == 0,
                  width: (MediaQuery.of(context).size.width - 32) / 3,
                ),
              ),
              Tab(
                child: CustomTab(
                  icon: 'assets/hockey_washer.png',
                  text: 'Hockey',
                  isSelected: _tabController.index == 1,
                  width: (MediaQuery.of(context).size.width - 32) / 3,
                ),
              ),
              Tab(
                child: CustomTab(
                  icon: 'assets/basketball_ball.png',
                  text: 'Basketball',
                  isSelected: _tabController.index == 2,
                  width: (MediaQuery.of(context).size.width - 32) / 3,
                ),
              ),
            ],
          ),
          collapsedHeight: 170,
          expandedHeight: 170,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: CalendarDays(
              selectedDay: _selectedDay,
              onDayTap: _onDayTap,
            ),
          ),
        ),
      ],
      body: TabBarView(
        controller: _tabController,
        children: [
          CalendarTabItem(
            sportType: SportType.football,
            day: _selectedDay,
          ),
          CalendarTabItem(
            sportType: SportType.hockey,
            day: _selectedDay,
          ),
          CalendarTabItem(
            sportType: SportType.basketball,
            day: _selectedDay,
          ),
        ],
      ),
    );
  }

  void _onDayTap(DateTime day) {
    setState(() {
      _selectedDay = day;
    });
  }
}

class CalendarDays extends StatefulWidget {
  const CalendarDays(
      {super.key, required this.selectedDay, required this.onDayTap});
  final DateTime selectedDay;
  final void Function(DateTime) onDayTap;

  @override
  State<CalendarDays> createState() => _CalendarDaysState();
}

class _CalendarDaysState extends State<CalendarDays> {
  final List<DateTime> days = [];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 31; i++) {
      final now = DateTime.now();
      days.add(now.add(Duration(days: i)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: days
            .map(
              (e) => GestureDetector(
                onTap: () => widget.onDayTap(e),
                child: Container(
                  margin: EdgeInsets.only(
                    left: days.indexOf(e) == 0 ? 8 : 0,
                    right: days.indexOf(e) == days.length - 1 ? 8 : 0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: e.isEqualDay(widget.selectedDay)
                          ? Theme.of(context).primaryColor
                          : null),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        DateFormat('EEE').format(e),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: e.isEqualDay(widget.selectedDay)
                              ? Colors.white
                              : const Color(0xFFAEAEAE),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          DateFormat('dd').format(e),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: e.isEqualDay(widget.selectedDay)
                                ? Theme.of(context).primaryColor
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

extension DateTimeEqual on DateTime {
  bool isEqualDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

class CalendarTabItem extends StatefulWidget {
  const CalendarTabItem(
      {super.key, required this.sportType, required this.day});
  final SportType sportType;
  final DateTime day;
  @override
  State<CalendarTabItem> createState() => _CalendarTabItemState();
}

class _CalendarTabItemState extends State<CalendarTabItem> {
  final ValueNotifier<List<MatchModel>> _matches = ValueNotifier([]);
  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(covariant CalendarTabItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.day.isEqualDay(oldWidget.day)) {
      return;
    }
    _matches.value = [];
    _init();
  }

  void _init() async {
    switch (widget.sportType) {
      case SportType.football:
        _matches.value = await FootballDatasource().matchesByDate(widget.day);
        return;
      case SportType.hockey:
        _matches.value = await HockeyDatasource().matchesByDate(widget.day);
        return;
      case SportType.basketball:
        _matches.value = await BasketballDatasource().matchesByDate(widget.day);
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: _matches,
        builder: (context, child) {
          return CustomScrollView(
            slivers: [
              _matches.value.isEmpty
                  ? SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )
                  : SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      sliver: SliverList.builder(
                        itemCount: _matches.value.length,
                        itemBuilder: (context, index) {
                          final match = _matches.value[index];
                          return CalendarMatchItem(match: match);
                        },
                      ),
                    ),
            ],
          );
        });
  }
}

class CalendarMatchItem extends StatelessWidget {
  const CalendarMatchItem({super.key, required this.match});
  final MatchModel match;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFECECEC),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      match.homeTeamTitle,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF2E2E2E),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Image.network(
                      match.homeTeamLogo,
                      width: 32,
                      height: 32,
                    ),
                  ],
                ),
              ),
              Text(
                '-',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xFF2E2E2E),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      match.awayTeamTitle,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF2E2E2E),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Image.network(
                      match.awayTeamLogo,
                      width: 32,
                      height: 32,
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFECECEC),
              ),
            ),
            child: Text(
              DateFormat('dd MMMM, yyyy | HH:mm').format(match.time),
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFFAEAEAE),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
