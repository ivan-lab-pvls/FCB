import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_news/app_go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2E2E2E),
            ),
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => context.pushNamed(AppGoRouter.settings),
          child: UnconstrainedBox(
            child: Image.asset(
              'assets/settings.png',
              height: 50,
            ),
          ),
        ),
      ],
    );
  }
}
