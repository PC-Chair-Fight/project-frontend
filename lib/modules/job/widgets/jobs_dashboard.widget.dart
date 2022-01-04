import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/modules/job/providers/jobs.provider.dart';
import 'package:project/modules/job/widgets/job_card.widget.dart';
import 'package:project/modules/job/widgets/job_filter_form.widget.dart';
import 'package:project/modules/job/widgets/job_sort_form.widget.dart';
import 'package:project/modules/job/widgets/jobs_dashboard_toolbar.widget.dart';
import 'package:project/modules/shared/utils/screen_layout.utils.dart';
import 'package:provider/provider.dart';

class JobsDashboard extends StatefulWidget {
  @override
  State<JobsDashboard> createState() => _JobsDashboardState();
}

class _JobsDashboardState extends State<JobsDashboard> {
  late JobsProvider jobsDashboardProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      jobsDashboardProvider.fetchJobs(0, 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    jobsDashboardProvider = Provider.of<JobsProvider>(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          JobsDashboardToolbar(),
          if (!ScreenLayout.isWide(context))
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ThemeConfig.of(context).mediumSpacing,
                vertical: ThemeConfig.of(context).smallSpacing,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildToolbarButton(
                      onPressed: _showFilterDialog,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.filter, size: 14),
                          SizedBox(width: ThemeConfig.of(context).smallSpacing),
                          Text('Filter*'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: ThemeConfig.of(context).mediumSpacing),
                  Expanded(
                    child: _buildToolbarButton(
                      onPressed: _showSortDialog,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.sort, size: 14),
                          SizedBox(width: ThemeConfig.of(context).smallSpacing),
                          Text('Sort*'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                      SizedBox(
                        width: ThemeConfig.of(context).appSmallWidth,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Card(
                              child: JobSortForm(),
                            ),
                            SizedBox(
                                height: ThemeConfig.of(context).mediumSpacing),
                            Card(
                              child: JobFilterForm(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: ThemeConfig.of(context).mediumSpacing),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                          width: ThemeConfig.of(context).appMediumWidth,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: jobsDashboardProvider.jobs
                              .map((e) => JobCard(
                                  roundEdges: !ScreenLayout.isSmall(context),
                                  job: e))
                              .toList(),
                        ),
                      ),
                      Flexible(
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                            width: ThemeConfig.of(context).appSmallWidth,
                          ),
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
                          .map((e) => JobCard(
                              roundEdges: !ScreenLayout.isSmall(context),
                              job: e))
                          .toList(),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolbarButton({
    required Function() onPressed,
    required Widget child,
  }) =>
      ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(ThemeConfig.of(context).surfaceColor),
          foregroundColor:
              MaterialStateProperty.all(ThemeConfig.of(context).primaryColor),
          overlayColor: MaterialStateProperty.all(
              ThemeConfig.of(context).primaryColor.withOpacity(.25)),
          shadowColor:
              MaterialStateProperty.all(ThemeConfig.of(context).shadowColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(ThemeConfig.of(context).borderRadius),
            ),
          ),
        ),
      );

  _showFilterDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) => JobFilterForm(),
    );
  }

  _showSortDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) => JobSortForm(),
    );
  }
}
