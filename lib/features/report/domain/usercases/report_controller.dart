import 'package:cloud_firestore/cloud_firestore.dart';

class ReportController {
  String listTxt(cubics) {
    String txt = '';
    for (DocumentSnapshot c in cubics) {
      txt += '${c['resultado']} \n';
      return txt;
    }
    return '';
  }
}
