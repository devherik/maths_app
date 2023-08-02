import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:maths_app/config/database/app_userstate.dart';

class DataState {
  final String uid = UserState().getUid();
  Future<void> createCubic(l, s, h) async {
    if (kDebugMode) {
      print(
          '$uid identidade --------------------------------------------------------------------------------------------------');
    }
    final cubic = FirebaseFirestore.instance.collection('users/$uid/cubics');
    await cubic
        .add({
          'comprimento': l,
          'largura': s,
          'altura': h,
          'resultado': l * s * h,
        })
        .then((value) => print('Valor adicionado'))
        .catchError((error) => print(error));
  }

  Future<QuerySnapshot<Object>> readCubics() async {
    CollectionReference cubicsData =
        FirebaseFirestore.instance.collection('users/$uid/cubics');
    final dynamic cubics = await cubicsData.snapshots();
    return cubics;
  }

  Future<QuerySnapshot<Object>> readCubic(id) async {
    CollectionReference cubicsData =
        FirebaseFirestore.instance.collection('users/$uid/cubics');
    final dynamic c = cubicsData.get(id);
    return c;
  }

  Future<void> deleteCubic(id) async {
    CollectionReference cubicsData =
        FirebaseFirestore.instance.collection('users/$uid/cubics');
    await cubicsData.doc(id).delete();
  }

  Future<String> getCubicString(dynamic id) async {
    dynamic c = await DataState().readCubic(id);
    return '${c['resultado'].toString()} metros cúbicos.';
  }
}
