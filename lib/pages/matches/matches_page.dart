import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sport_news/data/basketball_datasource.dart';
import 'package:sport_news/data/enum/sport_type.dart';
import 'package:sport_news/data/football_datasource.dart';
import 'package:sport_news/data/hockey_datasource.dart';
import 'package:sport_news/data/models/match.dart';
import 'package:sport_news/widgets/custom_app_bar.dart';
import 'package:sport_news/widgets/custom_tab.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
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
            title: 'SportsForecast Hub',
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
        ),
      ],
      body: TabBarView(
        controller: _tabController,
        children: const [
          TabItem(sportType: SportType.football),
          TabItem(sportType: SportType.hockey),
          TabItem(sportType: SportType.basketball),
        ],
      ),
    );
  }
}

class TabItem extends StatefulWidget {
  const TabItem({super.key, required this.sportType});
  final SportType sportType;

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  final ValueNotifier<List<MatchModel>> _matches = ValueNotifier([]);
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    switch (widget.sportType) {
      case SportType.football:
        _matches.value = await FootballDatasource().matches();
        return;
      case SportType.hockey:
        _matches.value = await HockeyDatasource().matches();
        return;
      case SportType.basketball:
        _matches.value = await BasketballDatasource().matches();
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
                        child: Text('No matches!'),
                      ),
                    )
                  : SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      sliver: SliverList.builder(
                        itemCount: _matches.value.length,
                        itemBuilder: (context, index) {
                          final match = _matches.value[index];
                          return MatchItem(match: match);
                        },
                      ),
                    ),
            ],
          );
        });
  }
}

class MatchItem extends StatelessWidget {
  const MatchItem({super.key, required this.match});
  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
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
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox.square(dimension: 32),
                ),
              ],
            ),
          ),
          Text(
            DateFormat('HH:mm').format(match.time),
            style: TextStyle(
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
                      const SizedBox.square(dimension: 32),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
