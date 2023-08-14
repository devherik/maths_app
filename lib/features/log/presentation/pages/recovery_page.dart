import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maths_app/core/util/widgets_util.dart';
import 'package:maths_app/features/log/domain/usecases/user_controller.dart';
import 'package:maths_app/config/globals.dart' as globals;

class RecoveryPage extends StatefulWidget {
  const RecoveryPage({super.key});

  @override
  State<RecoveryPage> createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(globals.backgroundImage), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40),
                child: SvgPicture.asset(
                  'assets/images/svg/svg_forget_password.svg',
                  semanticsLabel: 'Forgot Password',
                  height: 200,
                  width: 200,
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Receba um e-mail para restaurar sua senha.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: TextFormField(
                  controller: _emailController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      label: Text('Email'), hintText: 'usuario@mail.com'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: OutlinedButton(
                  style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll(5),
                    padding: MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.only(top: 20, bottom: 20, left: 80, right: 80),
                    ),
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 206, 228, 180),
                    ),
                  ),
                  onPressed: () {
                    if (_emailController.text.isEmpty) {
                      WidgetsUtil().showMessage('Campo vazio', context);
                    } else {
                      UserController()
                          .resetPassword(_emailController.text.trim());
                    }
                  },
                  child: const Text(
                    'ENVIAR',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
