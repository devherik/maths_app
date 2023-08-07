import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maths_app/features/log/domain/usecases/user_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, String? user});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final error = UserController().error$;
  bool isLogin = true;

  String _email = '';
  String _password = '';
  String _passwordValidate = '';

  @override
  void initState() {
    super.initState();
    error.addListener(() {
      setState(() {});
    });
  }

  Widget formTextField(String? title) {
    return TextFormField(
        decoration: InputDecoration(
          labelText: title,
        ),
        onChanged: (value) {
          switch (title) {
            case 'Email':
              setState(() {
                _email = value;
              });
            case 'Senha':
              setState(() {
                _password = value;
              });
            case 'Repita a senha':
              setState(() {
                _passwordValidate = value;
              });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton.icon(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                label: Text(
                  isLogin ? 'Registrar' : 'Entrar',
                  style: const TextStyle(color: Colors.blueGrey),
                ),
                icon: Icon(isLogin ? Icons.arrow_forward : Icons.arrow_back,
                    color: Colors.blueGrey),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(40),
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.transparent),
              child: Column(
                children: <Widget>[
                  formTextField('Email'),
                  formTextField('Senha'),
                  !isLogin ? formTextField('Repita a senha') : const SizedBox(),
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
                      if (isLogin) {
                        UserController()
                            .signInWithEmailAndPassword(_email, _password);
                      } else {
                        UserController().createUserWithEmailAndPassword(
                            _email, _password, _passwordValidate);
                        context.pop();
                      }
                    },
                    child: Text(
                      isLogin ? 'ENTRAR' : 'CADASTRAR',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '${error.value}',
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                  TextButton(
                    onPressed: () => {context.push('/recovery')},
                    child: const Text(
                      'Recuperar cadastro',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15),
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
