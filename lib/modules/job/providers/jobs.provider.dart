import 'package:flutter/cupertino.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/core/app_provider.dart';
import 'package:project/core/exceptions/base.exception.dart';
import 'package:project/modules/job/models/job.model.dart';
import 'package:project/modules/job/services/job.service.dart';

class JobsProvider extends AppProvider {
  final _jobService = inject.get<JobService>();

  List<Job> _jobs = [];
  bool _fetchLoading = false;
  dynamic _fetchError;

  bool get fetchLoading => _fetchLoading;

  List<Job> get jobs => _jobs;

  BaseException? get fetchError => _fetchError;

  JobsProvider(BuildContext ctx)
      : super(ctx);

  Future<void> updateJob(Job job) async {
    notify('updateJob', notificationType: NotificationType.Start);

    final found = _jobs.indexWhere((element) => element.id == job.id);
    if (found == -1){
      return;
    }

    _jobs[found] = job;
    notify('updateJob', notificationType: NotificationType.Success);
  }

  Future<void> fetchJobs(int index, int count) async {
    _fetchLoading = true;
    _fetchError = null;

    notify('getJobs', notificationType: NotificationType.Start);

    try {
      _jobs = await _jobService.getJobs(index, count);
      _fetchLoading = false;
      notify('getJobs', notificationType: NotificationType.Success);
    } catch (e) {
      _fetchError = e;
      _fetchLoading = false;
      notify('getJobs', notificationType: NotificationType.Failure, error: e);
    }
  }
}
