import 'package:flutter/material.dart';
import 'package:maths_app/config/routes/app_router.dart';
import 'package:maths_app/config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter().router,
      title: 'Maths',
      theme: AppTheme.light,
    );
  }
}
