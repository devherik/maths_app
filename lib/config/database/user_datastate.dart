import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:maths_app/config/database/app_userstate.dart';

class DataState {
  final String uid = UserState().getUid();
  Future<void> createCubic(l, s, h) async {
    final cubic = FirebaseFirestore.instance.collection('users/$uid/cubics');
    await cubic.add({
      'comprimento': l,
      'largura': s,
      'altura': h,
      'resultado': (l * s * h).roundToDouble(),
    }).then((value) {
      if (kDebugMode) {
        print('Valor adicionado');
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }

  Stream<QuerySnapshot<Object?>> readCubicsCollection() {
    CollectionReference cubicsData =
        FirebaseFirestore.instance.collection('users/$uid/cubics');
    return cubicsData.snapshots();
  }

  Future<void> deleteCubicDocument(id) async {
    CollectionReference cubicsData =
        FirebaseFirestore.instance.collection('users/$uid/cubics');
    await cubicsData.doc(id).delete();
  }
}
