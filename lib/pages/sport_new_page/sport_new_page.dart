import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sport_news/data/news_datasource.dart';

class SportNewPage extends StatelessWidget {
  const SportNewPage({super.key, required this.sportNew});

  final SportNew sportNew;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              leading: InkWell(
                onTap: () => context.pop(),
                child: UnconstrainedBox(
                  child: Image.asset(
                    'assets/back_button.png',
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
              centerTitle: false,
              title: const Text(
                'News',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF2E2E2E),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      sportNew.newImage,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      sportNew.newTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0xFF323232),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      DateFormat('yyyy-MM-dd').format(sportNew.newDate),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xFF8F8F8F),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      sportNew.newText,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(
                          0xFF323232,
                        ),
                      ),
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
