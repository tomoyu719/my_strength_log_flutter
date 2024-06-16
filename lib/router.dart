import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_strength_log_flutter/error_page.dart';
import 'package:my_strength_log_flutter/features/add_edit/add_edit_page.dart';
import 'package:my_strength_log_flutter/features/settings/settings_page.dart';
import 'package:my_strength_log_flutter/features/statistics/statistics_page.dart';
import 'package:my_strength_log_flutter/features/workouts/detail_page.dart';
import 'package:my_strength_log_flutter/features/workouts/list_page.dart';
import 'package:my_strength_log_flutter/scaffold_navigator.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/list',
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => ScaffoldNavigator(
        child: child,
      ),
      routes: <RouteBase>[
        GoRoute(
          path: '/list',
          builder: (context, state) => const ListPage(),
          routes: <RouteBase>[
            GoRoute(
              path: 'detail',
              builder: (context, state) {
                final id = state.extra as String;

                return DetailPage(id: id);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/statistics',
          builder: (context, state) => const StatisticsPage(),
        ),
      ],
    ),
    GoRoute(path: '/addEdit', builder: (context, state) => const AddEditPage()),
    GoRoute(
      path: '/settings',
      // builder: (context, state) => const SettingsPage(),
      pageBuilder: (context, state) => const MaterialPage(
        child: SettingsPage(),
        fullscreenDialog: true,
      ),
    ),
  ],
  errorBuilder: (context, state) => const ErrorPage(),
);
