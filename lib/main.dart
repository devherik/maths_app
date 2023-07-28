import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maths_app/config/routes/app_router.dart';
import 'package:maths_app/config/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
