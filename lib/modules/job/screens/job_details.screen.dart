import 'package:flutter/material.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/job/models/job.model.dart';
import 'package:project/modules/job/widgets/job_details.widget.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class JobDetailsScreen extends StatelessWidget {
  static const String route = '/job';
  final Job job;

  const JobDetailsScreen({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb
          ? null
          : AppBar(
              title: Text(S.of(context).JobDetailsScreen_title),
            ),
      body: JobDetails(job: job),
    );
  }
}
