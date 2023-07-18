import 'package:go_router/go_router.dart';
import 'package:maths_app/features/auth/presentation/pages/auth_page.dart';

class AppRouter {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthPage(),
      )
    ],
    initialLocation: '/auth',
  );
}
