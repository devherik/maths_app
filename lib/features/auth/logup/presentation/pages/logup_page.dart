import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maths_app/features/auth/login/presentation/blocs/auth_bloc.dart';

class LogupPage extends StatefulWidget {
  const LogupPage({super.key});

  @override
  State<LogupPage> createState() => _LogupPageState();
}

class _LogupPageState extends State<LogupPage> {
  String? email;
  String? name;
  String? password;
  String? confirmPass;
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
        child: Column(
          children: <Widget>[
            const Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Maths',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(40),
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                    ),
                    onChanged: (value) {
                      if (value != '') {
                        setState(() {
                          email = value;
                        });
                      }
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                    onChanged: (value) {
                      if (value != '') {
                        setState(() {
                          name = value;
                        });
                      }
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                    onChanged: (value) {
                      if (value != '') {
                        setState(() {
                          password = value;
                        });
                      }
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Confirmação da senha',
                    ),
                    onChanged: (value) {
                      if (value != '') {
                        setState(() {
                          confirmPass = value;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 50),
                  OutlinedButton(
                    style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(5),
                      padding: MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.only(
                            top: 20, bottom: 20, left: 80, right: 80),
                      ),
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 206, 228, 180),
                      ),
                    ),
                    onPressed: () {
                      if (AuthFields().formUpValidation(
                          name, email, password, confirmPass)) {
                        context.go('/home');
                      }
                    },
                    child: const Text(
                      'CADASTRAR',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
