import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/modules/job/providers/jobs_dashboard.provider.dart';
import 'package:project/modules/job/widgets/job_card.widget.dart';
import 'package:project/modules/job/widgets/jobs_dashboard_toolbar.widget.dart';
import 'package:project/modules/job/widgets/jobs_sort_filter_card.widget.dart';
import 'package:provider/provider.dart';

class JobsDashboard extends StatefulWidget {
  @override
  State<JobsDashboard> createState() => _JobsDashboardState();
}

class _JobsDashboardState extends State<JobsDashboard> {
  late JobsDashboardProvider jobsDashboardProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      jobsDashboardProvider.getJobs(0, 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    final wideLayout = MediaQuery.of(context).size.width > 1100;
    final smallLayout = MediaQuery.of(context).size.width < 800;

    jobsDashboardProvider = Provider.of<JobsDashboardProvider>(context);

    return Column(
      children: [
        JobsDashboardToolbar(),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: ThemeConfig.of(context).appMargin,
            horizontal: wideLayout ? ThemeConfig.of(context).appMargin : 0,
          ),
          child: wideLayout
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    JobsSortFilterCard(),
                    SizedBox(width: ThemeConfig.of(context).mediumSpacing),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: ThemeConfig.of(context).appMediumWidth,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: jobsDashboardProvider.jobs
                            .map((e) =>
                                JobCard(roundEdges: !smallLayout, job: e))
                            .toList(),
                      ),
                    ),
                  ],
                )
              : ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: ThemeConfig.of(context).appLargeWidth,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: jobsDashboardProvider.jobs
                        .map((e) => JobCard(roundEdges: !smallLayout, job: e))
                        .toList(),
                  ),
                ),
        ),
      ],
    );
  }
}
