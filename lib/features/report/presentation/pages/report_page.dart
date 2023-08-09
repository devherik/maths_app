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
              child: Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 50),
                child: ReportWdgets().streamCubics(),
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
