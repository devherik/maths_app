import 'package:flutter/material.dart';
import 'package:maths_app/features/report/domain/usercases/report_controller.dart';
import 'package:maths_app/features/report/presentation/widgets/report_widgets.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
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
