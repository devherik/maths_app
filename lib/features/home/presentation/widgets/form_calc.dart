import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class FormCalcWidgets {
  Widget squareForm() {
    return const Align(alignment: Alignment.center, child: Text('square'));
  }

  Widget dialogPopUp(context, resu) {
    return AlertDialog(
      backgroundColor:
          const Color.fromARGB(255, 206, 228, 180), //app base color
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "$resu",
            style: const TextStyle(color: Colors.black, fontSize: 40),
            textAlign: TextAlign.center,
          ),
          const Text(
            "metros cúbicos",
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        Align(
          alignment: Alignment.topCenter,
          child: TextButton(
            onPressed: () =>
                {Share.share('$resu metros cúbicos.', subject: 'Resultado.')},
            style: const ButtonStyle(
              //padding: MaterialStatePropertyAll<EdgeInsetsGeometry> (EdgeInsetsGeometry),
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              elevation: MaterialStatePropertyAll(5),
              alignment: Alignment.center,
            ),
            child: const Text(
              'COMPARTILHAR',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget msgPopUp(String msg) {
    return AlertDialog(
      backgroundColor:
          const Color.fromARGB(255, 206, 228, 180), //app base color
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            msg,
            style: const TextStyle(color: Colors.black, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
