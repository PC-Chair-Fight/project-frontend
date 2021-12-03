import 'package:flutter/cupertino.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/core/app_provider.dart';
import 'package:project/core/exceptions/base.exception.dart';
import 'package:project/modules/job/models/job.model.dart';
import 'package:project/modules/job/services/job.service.dart';

class JobsDashboardProvider extends AppProvider {
  final _jobService = inject.get<JobService>();

  List<JobModel> _jobs;
  bool _loading = false;
  BaseException? _error;

  bool get loading => _loading;

  List<JobModel> get jobs => _jobs;

  BaseException? get error => _error;

  JobsDashboardProvider(BuildContext ctx)
      : _jobs = <JobModel>[],
        super(ctx);

  Future<void> getJobs(index, count) async {
    _loading = true;
    _error = null;

    notify('getJobs', notificationType: NotificationType.Start);

    try {
      _jobs = await _jobService.getJobs(index, count);
      _loading = false;
      notify('getJobs', notificationType: NotificationType.Success);
    } on BaseException catch (e) {
      _error = e;
      _loading = false;
      notify('getJobs', notificationType: NotificationType.Failure);
    }
  }
}
