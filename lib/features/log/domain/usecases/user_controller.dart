import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:maths_app/config/database/app_database.dart';
import 'package:maths_app/config/database/app_userstate.dart';
import 'package:maths_app/features/log/domain/entities/user_entity.dart';

class UserController {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerPassVali = TextEditingController();
  final ValueNotifier error$ = ValueNotifier('');

  Future<bool> signInWithEmailAndPassword() async {
    try {
      await UserState().signInWithEmailAndPassword(
        email: controllerEmail.text,
        password: controllerPassword.text,
      );
      return true;
    } on FirebaseException catch (e) {
      error$.value = e.message;
      return false;
    }
  }

  Future<bool> createUserWithEmailAndPassword() async {
    if (controllerPassword == controllerPassVali) {
      try {
        await UserState().createUserWithEmailAndPassword(
          email: controllerEmail.text,
          password: controllerPassword.text,
        );
        return true;
      } on FirebaseException catch (e) {
        error$.value = e.message;
        return false;
      }
    } else {
      error$.value = 'Senhas diferentes';
      return false;
    }
  }

  final ValueNotifier<UserEntity> userActual$ = ValueNotifier<UserEntity>(
      UserEntity(email: 'email', password: 'password', name: 'name'));

  UserEntity getUser() => userActual$.value;

  bool formInValidation(String? user, String? password) {
    if (user != null && password != null) {
      try {
        return true;
      } catch (error) {
        if (kDebugMode) {
          print(error);
        }
        return false;
      }
    }
    return false;
  }

  bool formUpValidation(
      String? user, String? email, String? password, String? confirmPassword) {
    if (user != null &&
        password != null &&
        confirmPassword != null &&
        email != null) {
      if (kDebugMode) print('$user, $email, $password, $confirmPassword');
      if (password == confirmPassword) {
        try {
          userActual$.value =
              UserEntity(email: email, password: password, name: user);

          Database().addUser(userActual$.value);
          return true;
        } catch (error) {
          if (kDebugMode) {
            print(error);
          }
          return false;
        }
      }
    }
    return false;
  }

  String listTxt() {
    String txt = '';
    for (var i in userActual$.value.cubics$.value) {
      txt += '${i.getString()} \n';
    }
    return txt;
  }
}
