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
}
//   final ValueNotifier<UserEntity> userActual$ = ValueNotifier<UserEntity>(
//       UserEntity(email: 'email', password: 'password', name: 'name'));

//   UserEntity getUser() => userActual$.value;

//   bool formInValidation(String? user, String? password) {
//     if (user != null && password != null) {
//       try {
//         return true;
//       } catch (error) {
//         if (kDebugMode) {
//           print(error);
//         }
//         return false;
//       }
//     }
//     return false;
//   }

//   bool formUpValidation(
//       String? user, String? email, String? password, String? confirmPassword) {
//     if (user != null &&
//         password != null &&
//         confirmPassword != null &&
//         email != null) {
//       if (kDebugMode) print('$user, $email, $password, $confirmPassword');
//       if (password == confirmPassword) {
//         try {
//           userActual$.value =
//               UserEntity(email: email, password: password, name: user);

//           Database().addUser(userActual$.value);
//           return true;
//         } catch (error) {
//           if (kDebugMode) {
//             print(error);
//           }
//           return false;
//         }
//       }
//     }
//     return false;
//   }

//   String listTxt() {
//     String txt = '';
//     for (var i in userActual$.value.cubics$.value) {
//       txt += '${i.getString()} \n';
//     }
//     return txt;
//   }
// }
