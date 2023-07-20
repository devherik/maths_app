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
  var name;
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
      appBar: AppBar(
        actions: <Widget>[
          TextButton.icon(
            onPressed: () => {context.push('/logup')},
            label: const Text(
              'Conta',
              style: TextStyle(color: Colors.blueGrey),
            ),
            icon: const Icon(Icons.add, color: Colors.blueGrey),
          ),
        ],
      ),
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
                  const SizedBox(height: 50),
                  OutlinedButton(
                    style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(5),
                      padding: MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.only(
                            top: 20, bottom: 20, left: 100, right: 100),
                      ),
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 206, 228, 180),
                      ),
                    ),
                    onPressed: () {
                      if (bloc.AuthFields().formInValidation(name, password)) {
                        context.go('/home');
                      }
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
                      onPressed: () => {},
                      child: const Text(
                        'Recuperar cadastro',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
