import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sport_news/app_go_router.dart';
import 'package:sport_news/data/enum/sport_type.dart';
import 'package:sport_news/data/news_datasource.dart';
import 'package:sport_news/widgets/custom_app_bar.dart';
import 'package:sport_news/widgets/custom_tab.dart';

class SportNewsPage extends StatefulWidget {
  const SportNewsPage({super.key});

  @override
  State<SportNewsPage> createState() => _SportNewsPageState();
}

class _SportNewsPageState extends State<SportNewsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this)
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
            title: 'Sport News',
          ),
          pinned: true,
        ),
        SliverAppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          pinned: true,
          titleSpacing: 0,
          title: TabBar(
            isScrollable: true,
            indicatorColor: Theme.of(context).scaffoldBackgroundColor,
            dividerColor: Theme.of(context).scaffoldBackgroundColor,
            controller: _tabController,
            tabs: [
              Tab(
                child: CustomTab(
                  text: 'All News',
                  isSelected: _tabController.index == 0,
                  width: (MediaQuery.of(context).size.width - 32) / 3,
                ),
              ),
              Tab(
                child: CustomTab(
                  icon: 'assets/football_ball.png',
                  text: 'Football',
                  isSelected: _tabController.index == 1,
                  width: (MediaQuery.of(context).size.width - 32) / 3,
                ),
              ),
              Tab(
                child: CustomTab(
                  icon: 'assets/hockey_washer.png',
                  text: 'Hockey',
                  isSelected: _tabController.index == 2,
                  width: (MediaQuery.of(context).size.width - 32) / 3,
                ),
              ),
              Tab(
                child: CustomTab(
                  icon: 'assets/basketball_ball.png',
                  text: 'Basketball',
                  isSelected: _tabController.index == 3,
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
          SportNewsBody(),
          SportNewsBody(sportType: SportType.football),
          SportNewsBody(sportType: SportType.hockey),
          SportNewsBody(sportType: SportType.basketball),
        ],
      ),
    );
  }
}

class SportNewsBody extends StatelessWidget {
  const SportNewsBody({super.key, this.sportType});
  final SportType? sportType;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            final sportNew = news[index];

            return GestureDetector(
              onTap: () => context.pushNamed(
                AppGoRouter.sportNew,
                extra: sportNew,
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFECECEC),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          sportNew.newImage,
                          height: 100,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              sportNew.newTitle,
                              style: const TextStyle(
                                color: Color(0xFF323232),
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              sportNew.newText,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFFAEAEAE),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              DateFormat('yyyy-MM-dd').format(sportNew.newDate),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFFAEAEAE),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }

  List<SportNew> get news {
    switch (sportType) {
      case SportType.football:
        return NewsDatasource.footballNews;
      case SportType.hockey:
        return NewsDatasource.hockeyNews;

      case SportType.basketball:
        return NewsDatasource.basketballNews;

      case null:
        return NewsDatasource.allNews;
    }
  }
}
