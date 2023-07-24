import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maths_app/features/auth/login/domain/entities/cubicmeter_entity.dart';
import 'package:maths_app/features/auth/login/presentation/blocs/auth_bloc.dart';
import 'package:maths_app/features/home/presentation/blocs/home_bloc.dart';
import 'package:maths_app/features/home/presentation/widgets/form_calc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
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
                        HomeBloc().c$ = double.parse(value);
                      });
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
                        HomeBloc().l$ = double.parse(value);
                      });
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
                        HomeBloc().a$ = double.parse(value);
                      });
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
                    //instanciate the $cubic, then added it to the global lista, allowing to be accessed in all project
                    if (kDebugMode) {HomeBloc().a$},
                    if (!HomeBloc().isEmpty())
                      {
                        setState(() {
                          var cubic = CubicMeter(
                              HomeBloc().a$, HomeBloc().c$, HomeBloc().l$);
                          if (kDebugMode) {
                            print(cubic.getString());
                          }
                          AuthFields().userActual$.value.addCubic(cubic);
                          showDialog(
                            context: context,
                            builder: (context) => FormCalcWidgets()
                                .dialogPopUp(context, cubic.get()),
                          );
                        }),
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
