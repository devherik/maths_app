import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SvgPicture.asset(
                'assets/images/svg/svg_report.svg',
                height: 200,
                width: 200,
              ),
            ),
            Expanded(
              child: ReportWdgets().streamCubics(),
            ),
          ],
        ),
      ),
    );
  }
}
