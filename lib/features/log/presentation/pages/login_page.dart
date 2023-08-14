import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maths_app/features/log/domain/usecases/user_controller.dart';
import 'package:maths_app/config/globals.dart' as globals;

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
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(globals.backgroundImage), fit: BoxFit.cover),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 25),
            alignment: Alignment.center,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  child: Image.asset(
                    semanticLabel: 'Maths Logo',
                    globals.logoImage,
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
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
                Column(
                  children: <Widget>[
                    formTextField('Email'),
                    formTextField('Senha'),
                    !isLogin
                        ? formTextField('Repita a senha')
                        : const SizedBox(),
                    const SizedBox(height: 50),
                    OutlinedButton(
                      style: const ButtonStyle(
                        elevation: MaterialStatePropertyAll(5),
                        padding: MaterialStatePropertyAll<EdgeInsets>(
                            EdgeInsets.only(
                                top: 20, bottom: 20, left: 80, right: 80)),
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
                        }
                      },
                      child: Text(
                        isLogin ? 'ENTRAR' : 'CADASTRAR',
                        softWrap: false,
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
              ],
            ),
          )),
    );
  }
}
