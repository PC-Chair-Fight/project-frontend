import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/modules/job/providers/jobs_dashboard.provider.dart';
import 'package:project/modules/job/widgets/job_card.widget.dart';
import 'package:project/modules/job/widgets/jobs_dashboard_toolbar.widget.dart';
import 'package:project/modules/job/widgets/jobs_sort_filter_card.widget.dart';
import 'package:project/modules/shared/utils/screen_layout.utils.dart';
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
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          JobsDashboardToolbar(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: ThemeConfig.of(context).appMargin,
              horizontal: ScreenLayout.isSmall(context)
                  ? 0
                  : ThemeConfig.of(context).appMargin,
            ),
            child: ScreenLayout.isWide(context)
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
                          children: [
                            JobCard(roundEdges: !ScreenLayout.isSmall(context)),
                          ],
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
                      children: [
                        JobCard(roundEdges: !ScreenLayout.isSmall(context)),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
