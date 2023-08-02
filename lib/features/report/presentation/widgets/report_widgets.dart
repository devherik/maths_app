import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maths_app/config/database/user_datastate.dart';
import 'package:share_plus/share_plus.dart';

class ReportWdgets {
  Widget? streamCubics(cubics) {
    return StreamBuilder(
      stream: cubics,
      builder: (_, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          return ListView.builder(
            itemCount: streamSnapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot doc = streamSnapshot.data!.docs[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${index.toString()} | ",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 206, 228, 180),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor:
                                const Color.fromARGB(255, 206, 228, 180),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  DataState().getCubicString(doc.id).toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            actions: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Align(
                                    child: IconButton(
                                      onPressed: () => {
                                        DataState().deleteCubic(doc),
                                      },
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll<Color>(
                                                Colors.redAccent),
                                        elevation: MaterialStatePropertyAll(5),
                                        alignment: Alignment.center,
                                      ),
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    child: IconButton(
                                      onPressed: () => {
                                        Share.share(
                                            DataState()
                                                .getCubicString(doc.id)
                                                .toString(),
                                            subject: 'Resultado.')
                                      },
                                      style: const ButtonStyle(
                                        //padding: MaterialStatePropertyAll<EdgeInsetsGeometry> (EdgeInsetsGeometry),
                                        backgroundColor:
                                            MaterialStatePropertyAll<Color>(
                                                Colors.white),
                                        elevation: MaterialStatePropertyAll(5),
                                        alignment: Alignment.center,
                                      ),
                                      icon: const Icon(Icons.share),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        '${DataState().readCubic(doc).toString()} metros cúbicos.',
                        style: const TextStyle(
                            fontSize: 20, color: Colors.blueGrey),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          return const Text('Empty');
        }
      },
    );
  }
}
