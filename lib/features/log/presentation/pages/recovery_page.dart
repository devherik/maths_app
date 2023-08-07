import 'package:flutter/material.dart';
import 'package:maths_app/features/log/domain/usecases/user_controller.dart';

class RecoveryPage extends StatefulWidget {
  const RecoveryPage({super.key});

  @override
  State<RecoveryPage> createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background/mint_wallpaper.jpg'),
              fit: BoxFit.cover),
        ),
        child: Container(
          padding: const EdgeInsets.all(40),
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white),
          child: Column(
            children: <Widget>[
              const Align(
                alignment: Alignment.center,
                child: Text('Receba um e-mail para resetar sua senha.'),
              ),
              Align(
                alignment: Alignment.center,
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    label: Text('Email'),
                  ),
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
                  onPressed: () => UserController()
                      .resetPassword(emailController.text.trim()),
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
