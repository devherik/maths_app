import 'package:go_router/go_router.dart';
import 'package:maths_app/features/home/presentation/pages/home_page.dart';
import 'package:maths_app/features/log/presentation/pages/login_page.dart';
import 'package:maths_app/features/log/presentation/pages/logup_page.dart';
import 'package:maths_app/features/report/presentation/pages/report_page.dart';

class AppRouter {
  final router = GoRouter(
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
