import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maths_app/features/home/presentation/pages/home_page.dart';
import 'package:maths_app/features/log/presentation/pages/login_page.dart';
import 'package:maths_app/features/log/presentation/pages/logup_page.dart';
import 'package:maths_app/features/report/presentation/pages/report_page.dart';

class AppRouter {
  static GlobalKey<NavigatorState> _routerKey = GlobalKey<NavigatorState>();
  final router = GoRouter(
    navigatorKey: _routerKey,
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/logup',
        builder: (context, state) => const LogupPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/report',
        builder: (context, state) => const ReportPage(),
      )
    ],
    initialLocation: '/login',
  );
}
