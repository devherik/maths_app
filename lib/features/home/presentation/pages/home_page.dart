import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:maths_app/core/util/widgets_util.dart';
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
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          decoration: const BoxDecoration(
            color: Colors.white60,
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${_user?.email}',
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/images/svg/svg_drinkcoffee.svg',
                    semanticsLabel: 'Coffee Person',
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
              const Row(
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
              const Divider(color: Colors.blueGrey, thickness: 0.5),
              Row(
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
              const Divider(color: Colors.blueGrey, thickness: 0.5),
              Row(
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
              const Divider(color: Colors.blueGrey, thickness: 0.5),
              Row(
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
              const Divider(color: Colors.grey, thickness: 0.5),
              const Text(
                'Desenvolvido por Herik Colares\nversion 0.4',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(globals.backgroundImage), fit: BoxFit.cover),
        ),
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Comprimento', hintText: '0.1'),
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
                      labelText: 'Largura', hintText: '0.1'),
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
                      labelText: 'Altura', hintText: '0.1'),
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
                          WidgetsUtil()
                              .showMessage('Campo(s) vazio(s)', context)
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
