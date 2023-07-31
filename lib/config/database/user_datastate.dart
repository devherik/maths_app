import 'package:cloud_firestore/cloud_firestore.dart';

class DataState {
  CollectionReference firestoreData =
      FirebaseFirestore.instance.collection('cubics');

  Future<void> addCubic(l, s, h) {
    return firestoreData
        .add({
          'comprimento': l,
          'largura': s,
          'altura': h,
          'resultado': l * s * h,
        })
        .then((value) => print('Valor adicionado'))
        .catchError((error) => print(error));
  }
}
