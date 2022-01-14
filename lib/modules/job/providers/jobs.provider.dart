import 'package:flutter/material.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/core/app_provider.dart';
import 'package:project/core/exceptions/base.exception.dart';
import 'package:project/modules/job/models/job.model.dart';
import 'package:project/modules/job/models/job_filter_field.enum.dart';
import 'package:project/modules/job/models/job_query.model.dart';
import 'package:project/modules/job/providers/job_filter.provider.dart';
import 'package:project/modules/job/providers/job_sort.provider.dart';
import 'package:project/modules/job/services/job.service.dart';
import 'package:project/modules/job/providers/job_search.provider.dart';

class JobsProvider extends AppProvider {
  final _jobService = inject.get<JobService>();

  late JobSortProvider _jobSortProvider;
  late JobFilterProvider _jobFilterProvider;
  late JobSearchProvider _jobSearchProvider;

  List<Job> _jobs = [];
  bool _fetchLoading = false;
  dynamic _fetchError;

  bool get fetchLoading => _fetchLoading;

  List<Job> get jobs => _jobs;

  BaseException? get fetchError => _fetchError;

  JobsProvider(BuildContext ctx) : super(ctx);

  void update(
    JobSortProvider jobSortProvider,
    JobFilterProvider jobFilterProvider,
    JobSearchProvider jobSearchProvider,
  ) {
    _jobSortProvider = jobSortProvider;
    _jobFilterProvider = jobFilterProvider;
    _jobSearchProvider = jobSearchProvider;
  }

  Future<void> updateJob(Job job) async {
    notify('updateJob', notificationType: NotificationType.Start);
    final found = _jobs.indexWhere((element) => element.id == job.id);
    if (found >= 0) {
      _jobs[found] = job;
      notify('updateJob', notificationType: NotificationType.Success);
    }
  }

  Future<void> fetchJobs() async {
    _fetchLoading = true;
    _fetchError = null;
    notify('getJobs', notificationType: NotificationType.Start);
    try {
      _jobs = await _jobService.getJobs(JobQuery(
        index: 0,
        count: 100,
        orderBy: [_jobSortProvider.sortOrderField],
        ascending: [_jobSortProvider.ascending],
        filterFields: [JobFilterField.Name],
        filterValues: [_jobSearchProvider.searchText],
        exactFilters: [false],
        newerThan: _jobFilterProvider.postDateRange?.start,
        olderThan: _jobFilterProvider.postDateRange?.end,
      ));
      _fetchLoading = false;
      notify('getJobs', notificationType: NotificationType.Success);
    } catch (e) {
      _fetchError = e;
      _fetchLoading = false;
      notify('getJobs', notificationType: NotificationType.Failure, error: e);
    }
  }
}
