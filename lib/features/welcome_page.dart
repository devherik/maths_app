import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background/mint_wallpaper.jpg'),
              fit: BoxFit.cover),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Expanded(
            flex: 8,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/logo/logo_maths.png'),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Maths',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Maths foi feito com o objetivo de aprimorar as habilidades de desenvolvedor,'
                    'se apegando a uma ideia simples, mas que demandaria estudo e comprimetimento do mesmo. '
                    'Por isso, peço que não se apegue a simplicidade e usufrua do que foi feito com carinho.\n'
                    'Herik.',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      iconSize: 70,
                      icon: const Icon(Icons.arrow_forward_rounded,
                          color: Colors.blueGrey),
                      onPressed: () => context.go('/login'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
