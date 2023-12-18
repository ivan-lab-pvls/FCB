import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:sport_news/pages/notes/notes_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              centerTitle: true,
              leading: InkWell(
                onTap: () => context.pop(),
                child: UnconstrainedBox(
                  child: Image.asset(
                    'assets/back_button.png',
                    height: 50,
                  ),
                ),
              ),
              title: const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2E2E2E),
                ),
              ),
              pinned: true,
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 24),
                    SetTile(
                      path: 'assets/settings_1.svg',
                      title: 'Privacy Policy',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ViewRequestForRead(
                                      viewM: 'https://docs.google.com/document/d/1IGth470_YIUIgnybrEWY2DB76LP2esY3UzuQMsmkaYY/edit?usp=sharing',
                                    )));
                      },
                    ),
                    SetTile(
                      path: 'assets/settings_2.svg',
                      title: 'Terms of use',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ViewRequestForRead(
                                      viewM: 'https://docs.google.com/document/d/1hyM0-MKGbMVo3DW7HfcwR6epDmRI8AsqfM00nU16keU/edit?usp=sharing',
                                    )));
                      },
                    ),
                    SetTile(
                      path: 'assets/settings_3.svg',
                      title: 'Support',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ViewRequestForRead(
                                      viewM: 'https://forms.gle/h8PdimnCHWW3CuRg7',
                                    )));
                      },
                    ),
                    SetTile(
                      path: 'assets/settings_4.svg',
                      title: 'Rate app',
                      onTap: () {
                        InAppReview.instance.openStoreListing(
                          appStoreId: '6474534857',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SetTile extends StatelessWidget {
  const SetTile({
    super.key,
    required this.path,
    required this.title,
    required this.onTap,
  });

  final String path;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            SvgPicture.asset(
              path,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF2E2E2E),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
