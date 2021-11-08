import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/modules/job/widgets/jobCard.widget.dart';

class JobMainWidget extends StatefulWidget {
  @override
  JobMainState createState() {
    return JobMainState();
  }

}

class JobMainState extends State<JobMainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jobs"),
      ),
      body: JobCardWidget(),
    );
  }

}