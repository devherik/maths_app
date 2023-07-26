import 'package:flutter/material.dart';
import 'package:maths_app/features/log/domain/usecases/user_controller.dart';
import 'package:share_plus/share_plus.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final userActual = UserController().getUser();
  final userCubics = UserController().userActual$.value.cubics$.value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background/mint_wallpaper.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(
              height: 150,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'HISTÓRICO\\',
                  softWrap: true,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 10),
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: SizedBox(
                  child: Align(
                    alignment: Alignment.center,
                    child: ListView(
                      padding: const EdgeInsets.all(15),
                      children: <Widget>[
                        if (userCubics.isEmpty)
                          const Text(
                            'Aqui aparecerão seus resultados.',
                            style:
                                TextStyle(fontSize: 20, color: Colors.blueGrey),
                          ),
                        if (userCubics.isNotEmpty)
                          for (var i in userCubics)
                            SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "${userCubics.indexOf(i).toString()} | ",
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 206, 228, 180),
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
                                                      const Color.fromARGB(
                                                          255,
                                                          206,
                                                          228,
                                                          180), //app base color
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      Text(
                                                        i.getString(),
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                  actions: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Align(
                                                          child: IconButton(
                                                            onPressed: () => {
                                                              userCubics
                                                                  .remove(i)
                                                            },
                                                            style:
                                                                const ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStatePropertyAll<
                                                                          Color>(
                                                                      Colors
                                                                          .redAccent),
                                                              elevation:
                                                                  MaterialStatePropertyAll(
                                                                      5),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                            ),
                                                            icon: const Icon(
                                                              Icons.delete,
                                                              color: Colors
                                                                  .redAccent,
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          child: IconButton(
                                                            onPressed: () => {
                                                              Share.share(
                                                                  i.getString(),
                                                                  subject:
                                                                      'Resultado.')
                                                            },
                                                            style:
                                                                const ButtonStyle(
                                                              //padding: MaterialStatePropertyAll<EdgeInsetsGeometry> (EdgeInsetsGeometry),
                                                              backgroundColor:
                                                                  MaterialStatePropertyAll<
                                                                          Color>(
                                                                      Colors
                                                                          .white),
                                                              elevation:
                                                                  MaterialStatePropertyAll(
                                                                      5),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                            ),
                                                            icon: const Icon(
                                                                Icons.share),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ));
                                      },
                                      child: Text(
                                        '${i.get()} metros cúbicos.',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.blueGrey),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          if (userActual.cubics$.value.isEmpty) null,
          if (userActual.cubics$.value.isNotEmpty)
            Share.share(UserController().listTxt())
        },
        backgroundColor: const Color.fromARGB(255, 206, 228, 180),
        child: const Icon(Icons.share),
      ),
    );
  }
}
