import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/modules/job/widgets/main.widget.dart';

class JobMainScreen extends StatelessWidget {
  static const String route = '/main';

  const JobMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: JobMainWidget(),
      ),
    );
  }
}
