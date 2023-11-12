import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maths_app/core/util/widgets_util.dart';
import 'package:maths_app/features/log/domain/usecases/user_controller.dart';
import 'package:maths_app/config/globals.dart' as globals;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, String? user});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  var error = UserController().error$;
  bool isLogin = true;

  @override
  void initState() {
    super.initState();
    error.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  child: Image.asset(
                    semanticLabel: 'Maths Logo',
                    globals.logoImage,
                    fit: BoxFit.cover,
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
                    TextField(
                      controller: _emailController,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        hintText: 'usuario@mail.com',
                      ),
                    ),
                    TextField(
                      controller: _passwordController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.start,
                      obscureText: _showPassword,
                      maxLines: 1,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        hintText: '********',
                        suffixIcon: GestureDetector(
                          onTap: () => setState(() {
                            _showPassword = !_showPassword;
                          }),
                          child: !_showPassword
                              ? const Icon(Icons.visibility, size: 24)
                              : const Icon(Icons.visibility_off, size: 24),
                        ),
                      ),
                    ),
                    !isLogin
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 50),
                            child: TextField(
                                controller: _passwordConfirmationController,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.start,
                                obscureText: _showPassword,
                                maxLines: 1,
                                decoration: const InputDecoration(
                                  labelText: 'Repita a senha',
                                  hintText: '********',
                                )),
                          )
                        : const SizedBox(
                            height: 50,
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: MaterialButton(
                        onPressed: () {
                          if (isLogin) {
                            if (UserController().signIsEmpty(
                                _emailController.text.trim(),
                                _passwordController.text.trim())) {
                              WidgetsUtil()
                                  .showMessage('Campo(s) vazio(s)', context);
                            } else {
                              UserController().signInWithEmailAndPassword(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim());
                            }
                          } else {
                            if (UserController().createIsEmpty(
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                                _passwordConfirmationController.text.trim())) {
                              WidgetsUtil()
                                  .showMessage('Campo(s) vazio(s)', context);
                            } else {
                              UserController().createUserWithEmailAndPassword(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                  _passwordConfirmationController.text.trim());
                            }
                          }
                        },
                        color: const Color.fromARGB(255, 206, 228, 180),
                        elevation: 4,
                        splashColor: Colors.white24,
                        onLongPress: null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 18),
                        minWidth: MediaQuery.of(context).size.width,
                        child: Text(
                          isLogin ? 'ENTRAR' : 'CADASTRAR',
                          softWrap: false,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3),
                        ),
                      ),
                    ),
                    MaterialButton(
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
