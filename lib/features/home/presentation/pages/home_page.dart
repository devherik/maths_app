import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

//maths packages
import 'package:maths_app/config/database/app_userstate.dart';
import 'package:maths_app/features/home/presentation/widgets/home_widgets.dart';
import 'package:maths_app/config/database/entities/cubicmeter_entity.dart';
import 'package:maths_app/config/globals.dart' as globals;

class HomePage extends StatefulWidget {
  const HomePage({super.key, String? user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? _user = UserState().currentUser;

  Future<void> signOut() async {
    await UserState().signOut();
  }

  final _cubic = CubicMeter(0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(actions: [
        Align(
          alignment: Alignment.centerRight,
          child: Image.asset(globals.logoImage),
        )
      ]),
      drawer: Drawer(
        child: Container(
          padding:
              const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 15),
          decoration: const BoxDecoration(
            color: Colors.white60,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${_user?.email}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () => context.pop(),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.only(bottom: 30, top: 30),
                child: Image.asset(globals.logoImage),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.person, color: Colors.black),
                    TextButton(
                        onPressed: null,
                        child: Text(
                          'Perfil',
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
              ),
              const Divider(color: Colors.blueGrey, thickness: 0.5),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.history, color: Colors.black),
                    TextButton(
                        onPressed: () => context.push('/report'),
                        child: const Text(
                          'Meus resultados',
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
              ),
              const Divider(color: Colors.blueGrey, thickness: 0.5),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.share, color: Colors.black),
                    TextButton(
                        onPressed: () => Share.share(
                            'https://github.com/devherik/um-dos-app',
                            subject: 'GitHub Project Page'),
                        child: const Text(
                          'Compartilhe',
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
              ),
              const Divider(color: Colors.blueGrey, thickness: 0.5),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.logout_outlined, color: Colors.black),
                    TextButton(
                        onPressed: () => signOut(),
                        child: const Text(
                          'Sair',
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
              ),
              const Divider(color: Colors.grey, thickness: 0.5),
              const Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Desenvolvido por Herik Colares\nversion 0.4',
                      textAlign: TextAlign.center,
                    )),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(globals.backgroundImage), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white60),
          padding: const EdgeInsets.only(left: 40, right: 40),
          margin:
              const EdgeInsets.only(top: 200, bottom: 10, right: 10, left: 10),
          child: Align(
            alignment: Alignment.center,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Comprimento',
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9!.]'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != '') {
                      setState(() {
                        _cubic.length = double.parse(value);
                      });
                    } else {
                      _cubic.length = 0;
                    }
                  },
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Largura',
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9!.]'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != '') {
                      setState(() {
                        _cubic.size = double.parse(value);
                      });
                    } else {
                      _cubic.length = 0;
                    }
                  },
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Altura',
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9!.]'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != '') {
                      setState(() {
                        _cubic.heigth = double.parse(value);
                      });
                    } else {
                      _cubic.length = 0;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: OutlinedButton(
                    style: const ButtonStyle(
                      // alignment: AlignmentDirectional.bottomCenter,
                      elevation: MaterialStatePropertyAll(5),
                      padding: MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.only(
                              top: 20, bottom: 20, left: 80, right: 80)),
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 206, 228, 180),
                      ),
                    ),
                    onPressed: () => {
                      if (!_cubic.isEmpty())
                        {
                          setState(() {
                            if (kDebugMode) {
                              print(_cubic.getString());
                            }
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  HomeWidgets().dialogPopUp(context, _cubic),
                            );
                          }),
                        }
                      else
                        {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                HomeWidgets().msgPopUp('Campo(s) vazio(s)'),
                          )
                        },
                    },
                    child: const Text(
                      'CALCULAR',
                      style: TextStyle(color: Colors.black, fontSize: 20),
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
