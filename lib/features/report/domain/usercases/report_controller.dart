import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:maths_app/config/database/user_datastate.dart';
import 'package:share_plus/share_plus.dart';

class ReportController {
  final cubicsCollection = DataState().readCubicsCollection();
  void listTxt() {
    String txt = '';
    // cubicsCollection.listen(List<DocumentSnapshot> cubics) {

    // };
    StreamBuilder(
      stream: cubicsCollection,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        for (DocumentSnapshot c in streamSnapshot.data!.docs) {
          txt +=
              '${c.get('comprimento')} + ${c.get('largura')} + ${c.get('altura')} = ${c.get('resultado')} \n';
        }
        Share.share(txt);
        print(txt);
        return const Text('');
      },
    );
  }
}
