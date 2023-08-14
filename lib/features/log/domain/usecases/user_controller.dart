import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:maths_app/config/database/app_userstate.dart';

class UserController {
  ValueNotifier error$ = ValueNotifier('');

  Future<void> signInWithEmailAndPassword(email, password) async {
    try {
      await UserState().signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseException catch (e) {
      error$.value = e.message;
      if (kDebugMode) {
        print(error$);
      }
    }
  }

  Future<void> createUserWithEmailAndPassword(
      email, password, passwordValidate) async {
    if (password == passwordValidate) {
      try {
        await UserState().createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');
        try {
          users.add(UserState()
              .getUid()); //adiciona a coleção users no firebase um usuario com o id da authentication
        } on FirebaseException catch (e) {
          error$.value = e.message;
        }
      } on FirebaseException catch (e) {
        error$.value = e.message;
        if (kDebugMode) {
          print(error$);
        }
      }
    } else {
      error$.value = 'Senhas diferentes';
      if (kDebugMode) {
        print(error$);
      }
    }
  }

  Future<void> resetPassword(String value) async {
    try {
      await UserState().resetPassword(email: value);
    } on FirebaseException catch (e) {
      error$.value = e.message;
    }
  }

  bool createIsEmpty(String e, String p, String pc) {
    if (e.isEmpty && p.isEmpty && pc.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool signIsEmpty(String e, String p) {
    if (e.isEmpty && p.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
