import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/core/utils.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/job/models/job_order_field.enum.dart';
import 'package:project/modules/job/providers/job_filter.provider.dart';
import 'package:project/modules/job/providers/job_sort.provider.dart';
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
  late JobsProvider _jobsProvider;
  late JobFilterProvider _filterProvider;
  late JobSortProvider _sortProvider;
  Timer? searchDebounceTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _fetchJobs();
    });
  }

  @override
  void dispose() {
    searchDebounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _jobsProvider = Provider.of<JobsProvider>(context);
    _filterProvider = Provider.of<JobFilterProvider>(context);
    _sortProvider = Provider.of<JobSortProvider>(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          JobsDashboardToolbar(
            onChanged: () {
              if (searchDebounceTimer?.isActive ?? false)
                searchDebounceTimer!.cancel();
              searchDebounceTimer =
                  Timer(Duration(milliseconds: 300), _fetchJobs);
            },
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                _fetchJobs();
              },
              child: ListView(
                children: [
                  if (!ScreenLayout.isWide(context))
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: ThemeConfig.of(context).appMediumWidth),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ThemeConfig.of(context).mediumSpacing,
                          vertical: ThemeConfig.of(context).smallSpacing,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: _buildFilterButton(),
                            ),
                            SizedBox(
                                width: ThemeConfig.of(context).mediumSpacing),
                            Expanded(
                              child: _buildSortButton(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ScreenLayout.isWide(context)
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: ThemeConfig.of(context).mediumSpacing),
                            SizedBox(
                              width: ThemeConfig.of(context).appSmallWidth,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Card(
                                    child: JobSortForm(
                                      onChanged: _fetchJobs,
                                    ),
                                  ),
                                  SizedBox(
                                      height: ThemeConfig.of(context)
                                          .mediumSpacing),
                                  Card(
                                    child: JobFilterForm(
                                      onChanged: _fetchJobs,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                width: ThemeConfig.of(context).mediumSpacing),
                            ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                width: ThemeConfig.of(context).appMediumWidth,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  ..._jobsProvider.jobs.map((e) => JobCard(
                                      roundEdges:
                                          !ScreenLayout.isSmall(context),
                                      job: e))
                                ]
                                    .intersperse(SizedBox(
                                        height: ThemeConfig.of(context)
                                            .smallSpacing))
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
                            children: _jobsProvider.jobs
                                .map((e) => Padding(
                                      padding: EdgeInsets.only(
                                          bottom: ThemeConfig.of(context)
                                              .mediumSpacing),
                                      child: JobCard(
                                        roundEdges:
                                            !ScreenLayout.isSmall(context),
                                        job: e,
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton() => ElevatedButton(
        onPressed: _showFilterDialog,
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.filter, size: 14),
              SizedBox(width: ThemeConfig.of(context).smallSpacing),
              Text(S.of(context).JobsDashboardScreen_filter),
            ],
          ),
        ),
        style: ThemeConfig.of(context).appElevatedButtonAltStyle().copyWith(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      ThemeConfig.of(context).borderRadius),
                  side: _filterProvider.hasFilters
                      ? BorderSide(
                          color: ThemeConfig.of(context).primaryColor, width: 2)
                      : BorderSide.none,
                ),
              ),
            ),
      );

  Widget _buildSortButton() => ElevatedButton(
        onPressed: _showSortDialog,
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _sortProvider.ascending
                    ? FontAwesomeIcons.sortAmountUp
                    : FontAwesomeIcons.sortAmountDown,
                size: 14,
              ),
              SizedBox(width: ThemeConfig.of(context).smallSpacing),
              Text(S.of(context).JobsDashboardScreen_sortingBy),
              SizedBox(width: ThemeConfig.of(context).smallestSpacing),
              Text(
                {
                  JobOrderField.PostDate:
                      S.of(context).JobSortForm_postDateCriteria
                }[_sortProvider.sortOrderField]!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        style: ThemeConfig.of(context).appElevatedButtonAltStyle(),
      );

  _showFilterDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) => JobFilterForm(
        onChanged: _fetchJobs,
      ),
    );
  }

  _showSortDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) => JobSortForm(
        onChanged: _fetchJobs,
      ),
    );
  }

  _fetchJobs() {
    // This action is delayed by zero to wrap this call inside a coroutine.
    // Without this delay, the jobProvider would start fetchJobs before it would be internally notified by
    // the filter & sort provider (since that notification is also defined as a coroutine and is scheduled
    // to execute after this bit of synchronous code... I think).
    Future.delayed(Duration.zero, () {
      _jobsProvider.fetchJobs();
    });
  }
}
