import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import 'package:maths_app/config/database/user_datastate.dart';

class ReportWdgets {
  Widget streamCubics() {
    final cubicsCollection = DataState().readCubicsCollection();
    return StreamBuilder(
      stream: cubicsCollection,
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
                        color: Color.fromARGB(255, 100, 161, 30),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  TextButton(
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
                                '${doc.get('comprimento')} comprimento\n+ ${doc.get('largura')} largura\n+ ${doc.get('altura')} altura\n= ${doc.get('resultado')} total',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          actions: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Align(
                                  child: TextButton(
                                    onPressed: null,
                                    onLongPress: () => {
                                      DataState().deleteCubicDocument(doc.id),
                                      context.pop(),
                                    },
                                    style: const ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll<Color>(
                                              Colors.white),
                                      elevation: MaterialStatePropertyAll(5),
                                      alignment: Alignment.center,
                                    ),
                                    child: const Text(
                                      'EXCLUIR',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  child: TextButton(
                                    onPressed: () => {
                                      Share.share(
                                          '${doc.get('comprimento')} comprimento\n+ ${doc.get('largura')} largura\n+ ${doc.get('altura')} altura\n= ${doc.get('resultado')} total',
                                          subject: 'Resultado.')
                                    },
                                    style: const ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll<Color>(
                                              Colors.white),
                                      elevation: MaterialStatePropertyAll(5),
                                      alignment: Alignment.center,
                                    ),
                                    child: const Text(
                                      'COMPARTILHAR',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      '${doc.get('resultado')} metros cúbico.',
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          return const Center(child: Text('Seus resultados apareçerão aqui.'));
        }
      },
    );
  }
}
