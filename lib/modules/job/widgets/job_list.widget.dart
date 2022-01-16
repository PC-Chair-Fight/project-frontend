import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/modules/job/models/job.model.dart';
import 'package:project/modules/job/widgets/job_card.widget.dart';
import 'package:project/modules/shared/utils/screen_layout.utils.dart';

class JobList extends StatelessWidget {
  final List<Job> jobs;

  const JobList({Key? key, required this.jobs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      shrinkWrap: true,
      children: [
        ...jobs.map((e) => Padding(
              padding: EdgeInsets.only(
                  bottom: ThemeConfig.of(context).mediumSpacing),
              child: JobCard(
                roundEdges: !ScreenLayout.isSmall(context),
                job: e,
              ),
            )),
      ],
    );
  }
}
