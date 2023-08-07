import 'package:go_router/go_router.dart';
import 'package:maths_app/features/home/presentation/pages/home_page.dart';
import 'package:maths_app/features/log/presentation/pages/login_page.dart';
import 'package:maths_app/features/log/presentation/pages/recovery_page.dart';
import 'package:maths_app/features/report/presentation/pages/report_page.dart';
import 'package:maths_app/features/welcome_page.dart';
import 'package:maths_app/widget_tree.dart';

class AppRouter {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/recovery',
        builder: (context, state) => const RecoveryPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/report',
        builder: (context, state) => const ReportPage(),
      ),
      GoRoute(
        path: '/widgetTree',
        builder: (context, state) => const WidgetTree(),
      )
    ],
    initialLocation: '/widgetTree',
  );
}
