import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/modules/job/widgets/job_card.widget.dart';
import 'package:project/modules/job/widgets/jobs_dashboard_toolbar.widget.dart';
import 'package:project/modules/job/widgets/jobs_sort_filter_card.widget.dart';
import 'package:project/modules/navigation/widgets/app_side_navigation_bar.dart';

class JobsDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wideLayout = MediaQuery.of(context).size.width > 1100;
    final smallLayout = MediaQuery.of(context).size.width < 800;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        JobsDashboardToolbar(),
        Row(
          children: [
            AppSideNavigationBar(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: ThemeConfig.of(context).appMargin,
                  horizontal: smallLayout ? 0 : ThemeConfig.of(context).appMargin,
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
                              children: [
                                JobCard(roundEdges: !smallLayout),
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
                            JobCard(roundEdges: !smallLayout),
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
