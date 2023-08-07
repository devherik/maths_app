import 'package:flutter/widgets.dart';
import 'package:maths_app/config/database/app_userstate.dart';
import 'package:maths_app/features/home/presentation/pages/home_page.dart';
import 'package:maths_app/features/log/presentation/pages/login_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: UserState().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
