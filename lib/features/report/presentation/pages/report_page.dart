import 'package:flutter/material.dart';

import 'package:maths_app/features/report/domain/usercases/report_controller.dart';
import 'package:maths_app/features/report/presentation/widgets/report_widgets.dart';
import 'package:maths_app/config/globals.dart' as globals;

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Align(
          alignment: Alignment.centerRight,
          child: Image.asset(globals.logoImage),
        )
      ]),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(globals.backgroundImage), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Container(
                margin: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 10),
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: SizedBox(
                  child: ReportWdgets().streamCubics(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {ReportController().listTxt()},
        backgroundColor: const Color.fromARGB(255, 206, 228, 180),
        child: const Icon(Icons.share),
      ),
    );
  }
}
