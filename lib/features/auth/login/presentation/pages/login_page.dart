import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maths_app/features/auth/login/presentation/blocs/auth_bloc.dart'
    as bloc;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var user;
  var password;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
              flex: 4,
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
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(40),
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Usuário/E-mail',
                      ),
                      onChanged: (value) => (user = value),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                      ),
                      onChanged: (value) => (password = value),
                    ),
                    const SizedBox(height: 50),
                    OutlinedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    side: BorderSide(color: Colors.blueGrey))),
                        elevation: const MaterialStatePropertyAll(5),
                        padding: const MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.only(
                              top: 20, bottom: 20, left: 60, right: 60),
                        ),
                        backgroundColor: const MaterialStatePropertyAll<Color>(
                          Color.fromARGB(255, 206, 228, 180),
                        ),
                      ),
                      onPressed: () {
                        bloc.AuthFields().formInValidation(user, password);
                      },
                      child: const Text(
                        'ENTRAR',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                        onPressed: () => {context.push('/logup')},
                        child: const Text(
                          'Crie sua conta aqui',
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 15),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
