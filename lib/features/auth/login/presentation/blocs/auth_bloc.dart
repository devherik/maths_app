import 'package:flutter/material.dart';
import 'package:maths_app/features/auth/login/data/data_sources/app_database.dart'
    as appDB;
import 'package:maths_app/features/auth/login/domain/entities/user_entity.dart';

class AuthFields {
  late ValueNotifier<UserEntity> userActual$;
  bool formInValidation(String? user, String? password) {
    if (user != null && password != null) {
      print('$user $password');
      try {
        userActual$.value = appDB.Database().getUser(user);
        AuthLog().logIn();
        return true;
      } catch (error) {
        print(error.toString());
        return false;
      }
    }
    return false;
  }

  void formUpValidation(
      String? user, String? password, String? confirmPassword) {}
}

class AuthLog extends ValueNotifier<bool> {
  // vai sempre devolver um bool com a situação do usuario, logado ou não
  AuthLog() : super(false); // construtor que passa false quando é criado

  logIn() => value = true;
  logOut() => value = false;
  bool isLogged() {
    return value;
  }
}
