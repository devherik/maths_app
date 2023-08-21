import 'package:flutter/material.dart';
import 'package:maths_app/core/util/widgets_util.dart';
import 'package:share_plus/share_plus.dart';

import 'package:maths_app/config/database/entities/cubicmeter_entity.dart';
import 'package:maths_app/config/database/user_datastate.dart';

class HomeWidgets {
  Widget squareForm() {
    return const Align(alignment: Alignment.center, child: Text('square'));
  }

  Widget dialogPopUp(homeContext, CubicMeter c) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            c.get().toString(),
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
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () =>
                      {Share.share(c.getString(), subject: 'Resultado.')},
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 206, 228, 180),
                    ),
                    elevation: MaterialStatePropertyAll(5),
                    alignment: Alignment.center,
                  ),
                  child: const Text(
                    'COMPARTILHAR',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () => {
                    DataState().createCubic(c.length, c.size, c.heigth),
                    WidgetsUtil().showMessage(
                        'Pronto (o valor pode ter sido arredondado)',
                        homeContext),
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 206, 228, 180),
                    ),
                    elevation: MaterialStatePropertyAll(5),
                    alignment: Alignment.center,
                  ),
                  child: const Text(
                    'SALVAR',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            )),
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
