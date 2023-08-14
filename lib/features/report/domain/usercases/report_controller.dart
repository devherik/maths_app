import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:maths_app/config/database/user_datastate.dart';
import 'package:share_plus/share_plus.dart';

class ReportController {
  final cubicsCollection = DataState().readCubicsCollection();
  void listTxt() {
    String txt = '';
    StreamBuilder(
      stream: cubicsCollection,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        for (DocumentSnapshot c in streamSnapshot.data!.docs) {
          txt +=
              '${c.get('comprimento')} + ${c.get('largura')} + ${c.get('altura')} = ${c.get('resultado')} \n';
          if (kDebugMode) {
            print(txt);
          }
        }
        Share.share(txt);
        if (kDebugMode) {
          print(txt);
        }
        return const Text('');
      },
    );
  }
}
