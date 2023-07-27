import 'package:flutter/material.dart';

class UserState extends ValueNotifier<bool> {
  // vai sempre devolver um bool com a situação do usuario, logado ou não
  UserState() : super(false); // construtor que passa false quando é criado

  logIn() => value = true;
  logOut() => value = false;
  bool isLogged() {
    return value;
  }
}
