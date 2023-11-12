import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(globals.backgroundImage), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
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
                  'Insira seu e-mail para restaurar sua senha.',
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
                      label: Text('E-mail'), hintText: 'usuario@mail.com'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: MaterialButton(
                  onPressed: () {
                    if (_emailController.text.isEmpty) {
                      WidgetsUtil().showMessage('Campo vazio', context);
                    } else {
                      UserController()
                          .resetPassword(_emailController.text.trim());
                      WidgetsUtil()
                          .showMessage('Confira sua caixa de e-mail', context);
                      context.pop();
                    }
                  },
                  color: const Color.fromARGB(255, 206, 228, 180),
                  elevation: 4,
                  splashColor: Colors.white24,
                  onLongPress: null,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  minWidth: MediaQuery.of(context).size.width,
                  child: const Text(
                    'ENVIAR',
                    softWrap: false,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
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
