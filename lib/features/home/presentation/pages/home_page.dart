import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:maths_app/features/home/presentation/blocs/home_bloc.dart';
import 'package:maths_app/features/home/presentation/widgets/form_calc.dart';
import 'package:maths_app/features/log/domain/entities/cubicmeter_entity.dart';
import 'package:maths_app/features/log/domain/usecases/user_controller.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, String? user});

  @override
  State<HomePage> createState() => _HomePageState();
}

// forms não estão funcionando cooretamente
// usuario não aparece logadp

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   if (!UserState().value) {
  //     context.go('/login');
  //   }
  //   super.initState();
  // }

  final _cubic = CubicMeter(0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(
          255,
          206,
          228,
          180,
        ),
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 120,
                child: Align(
                  alignment: Alignment.center,
                  child: ValueListenableBuilder(
                    valueListenable: UserController().userActual$,
                    builder: (_, value, __) => Text(
                      'Seja muito bem vindo, ${value.name}',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TextButton.icon(
                  onPressed: () => {context.push('/report')},
                  style: const ButtonStyle(),
                  icon: const Icon(Icons.lock_clock, color: Colors.blueGrey),
                  label: const Text(
                    'RELATORIO',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TextButton.icon(
                  onPressed: () => {
                    Share.share('https://github.com/devherik/um-dos-app',
                        subject: 'GitHub Project Page')
                  },
                  style: const ButtonStyle(),
                  icon: const Icon(Icons.share, color: Colors.blueGrey),
                  label: const Text(
                    'COMPARTILHAR',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TextButton.icon(
                  onPressed: () => {HomeBloc().closeApp()},
                  style: const ButtonStyle(),
                  icon: const Icon(Icons.close, color: Colors.blueGrey),
                  label: const Text(
                    'FECHAR',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text('version 0.3')),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background/mint_wallpaper.jpg'),
              fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          padding: const EdgeInsets.all(40),
          margin:
              const EdgeInsets.only(top: 200, bottom: 10, right: 10, left: 10),
          child: Align(
            alignment: Alignment.center,
            child: Column(
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
                OutlinedButton(
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
                          UserController().userActual$.value.addCubic(
                              _cubic); //talvez seja melhor dar a opção de salvar o resultado ao user
                          showDialog(
                            context: context,
                            builder: (context) => FormCalcWidgets()
                                .dialogPopUp(context, _cubic.get()),
                          );
                        }),
                      }
                    else
                      {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              FormCalcWidgets().msgPopUp('Campo(s) vazio(s)'),
                        )
                      },
                  },
                  child: const Text(
                    'CALCULAR',
                    style: TextStyle(color: Colors.black, fontSize: 20),
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
