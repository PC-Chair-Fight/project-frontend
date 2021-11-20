import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/modules/job/widgets/jobs_dashboard.widget.dart';

class JobsDashboardScreen extends StatelessWidget {
  static const String route = '/jobs';

  const JobsDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: JobsDashboard(),
    );
  }
}
