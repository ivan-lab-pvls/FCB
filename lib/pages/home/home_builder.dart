import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeBuilder extends StatelessWidget {
  const HomeBuilder({super.key, required this.child});
  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: child),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 60,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Row(
            children: [
              BarItem(
                p: 'assets/bottom_bar/matches.svg',
                actP: 'assets/bottom_bar/matches_act.svg',
                isActive: child.currentIndex == 0,
                onTap: () => _onBarItemTap(0),
              ),
              BarItem(
                p: 'assets/bottom_bar/calendar.svg',
                actP: 'assets/bottom_bar/calendar_act.svg',
                isActive: child.currentIndex == 1,
                onTap: () => _onBarItemTap(1),
              ),
              BarItem(
                p: 'assets/bottom_bar/sport_news.svg',
                actP: 'assets/bottom_bar/sport_news_act.svg',
                isActive: child.currentIndex == 2,
                onTap: () => _onBarItemTap(2),
              ),
              BarItem(
                p: 'assets/bottom_bar/notes.svg',
                actP: 'assets/bottom_bar/notes_act.svg',
                isActive: child.currentIndex == 3,
                onTap: () => _onBarItemTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onBarItemTap(int index) => child.goBranch(index);
}

class BarItem extends StatelessWidget {
  const BarItem({
    super.key,
    required this.p,
    required this.actP,
    required this.isActive,
    required this.onTap,
  });

  final String p;
  final String actP;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: SvgPicture.asset(isActive ? actP : p),
      ),
    );
  }
}
