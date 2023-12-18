import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_news/data/news_datasource.dart';
import 'package:sport_news/pages/calendar/calendar_page.dart';
import 'package:sport_news/pages/home/home_builder.dart';
import 'package:sport_news/pages/init/init_page.dart';
import 'package:sport_news/pages/matches/matches_page.dart';
import 'package:sport_news/pages/notes/add_note_page.dart';
import 'package:sport_news/pages/notes/notes_page.dart';
import 'package:sport_news/pages/settings/settings_page.dart';
import 'package:sport_news/pages/sport_new_page/sport_new_page.dart';
import 'package:sport_news/pages/sport_news/sport_news_page.dart';

final _navigatorRootKey = GlobalKey<NavigatorState>();

class AppGoRouter {
  /// pages
  static const String init = '/initPage';

  static const String matches = '/matchesPage';

  static const String calendar = '/calendarPage';

  static const String sportNews = '/sportNewsPage';

  static const String notes = '/notesPage';

  static const String sportNew = '/sportNewPage';

  static const String addNote = '/addNotePage';

  static const String settings = '/settingsPage';

  static final GoRouter _router = GoRouter(
    navigatorKey: _navigatorRootKey,
    initialLocation: init,
    routes: [
      GoRoute(
        name: init,
        path: init,
        builder: (context, state) => const InitPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            HomeBuilder(child: navigationShell),
        branches: [
          StatefulShellBranch(
            initialLocation: matches,
            routes: [
              GoRoute(
                name: matches,
                path: matches,
                builder: (context, state) => const MatchesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: calendar,
            routes: [
              GoRoute(
                name: calendar,
                path: calendar,
                builder: (context, state) => const CalendarPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: sportNews,
            routes: [
              GoRoute(
                name: sportNews,
                path: sportNews,
                builder: (context, state) => const SportNewsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: notes,
            routes: [
              GoRoute(
                name: notes,
                path: notes,
                builder: (context, state) => const NotesPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _navigatorRootKey,
        path: sportNew,
        name: sportNew,
        builder: (context, state) => SportNewPage(
          sportNew: state.extra as SportNew,
        ),
      ),
      GoRoute(
        parentNavigatorKey: _navigatorRootKey,
        path: addNote,
        name: addNote,
        builder: (context, state) => const AddNotePage(),
      ),
      GoRoute(
        parentNavigatorKey: _navigatorRootKey,
        path: settings,
        name: settings,
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );

  static GoRouter get goRouter => _router;
}
