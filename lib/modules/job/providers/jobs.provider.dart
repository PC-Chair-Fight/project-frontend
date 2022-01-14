import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/core/app_provider.dart';
import 'package:project/modules/job/models/job.model.dart';
import 'package:project/modules/job/models/job_filter_field.enum.dart';
import 'package:project/modules/job/models/job_query.model.dart';
import 'package:project/modules/job/providers/job_filter.provider.dart';
import 'package:project/modules/job/providers/job_search.provider.dart';
import 'package:project/modules/job/providers/job_sort.provider.dart';
import 'package:project/modules/job/services/job.service.dart';

class JobsProvider extends AppProvider {
  final _jobService = inject.get<JobService>();

  late JobSortProvider _jobSortProvider;
  late JobFilterProvider _jobFilterProvider;
  late JobSearchProvider _jobSearchProvider;

  List<Job> _jobs = [];

  bool _fetchLoading = false;
  dynamic _fetchError;

  bool get fetchLoading => _fetchLoading;

  dynamic get fetchError => _fetchError;

  bool _addLoading = false;
  dynamic _addError;

  bool get addLoading => _addLoading;

  dynamic get addError => _addError;

  List<Job> get jobs => _jobs;

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

  Future<Job?> addJob(
    String name,
    String description,
    List<Uint8List> images,
  ) async {
    _addLoading = false;
    _addError = null;
    notify('addJob', notificationType: NotificationType.Start);

    try {
      final createdJob = await _jobService.createJob(name, description, images);
      _addLoading = false;
      notify('addJob', notificationType: NotificationType.Success);
      return createdJob;
    } catch (e) {
      _addError = e;
      _addLoading = false;
      notify('addJob', notificationType: NotificationType.Failure, error: e);
    }
  }
}
