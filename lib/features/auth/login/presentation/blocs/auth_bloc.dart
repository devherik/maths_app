import 'package:flutter/material.dart';

class AuthFields {
  String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Digite sua senha';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Digite uma senha valida';
      } else {
        return null;
      }
    }
  }

  bool formInValidation(String? user, String? password) {
    if (user != null && password != null) {
      // busca no bd o usuario e valida a senha, fazendo então a rota pra próxima tela
      AuthLog().logIn();
      print('$user $password');
      return true;
    }
    return false;
  }

  void formUpValidation(String? user, String? password, String? passConf) {}
}

class AuthLog extends ValueNotifier<bool> {
  // vai sempre devolver um bool com a situação do usuario, logado ou não
  AuthLog() : super(false); // construtor que passa false quando é criado

  logIn() => value = true;
  logOut() => value = false;
}
