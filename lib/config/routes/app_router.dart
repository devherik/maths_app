import 'package:go_router/go_router.dart';
import 'package:maths_app/features/auth/login/presentation/pages/login_page.dart';
import 'package:maths_app/features/auth/logup/presentation/pages/logup_page.dart';
import 'package:maths_app/features/home/presentation/pages/home_page.dart';

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
      )
    ],
    initialLocation: '/login',
  );
}
