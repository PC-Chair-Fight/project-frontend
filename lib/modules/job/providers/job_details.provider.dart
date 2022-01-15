import 'package:flutter/src/widgets/framework.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/core/app_provider.dart';
import 'package:project/core/exceptions/base.exception.dart';
import 'package:project/modules/job/models/job.model.dart';
import 'package:project/modules/job/providers/jobs.provider.dart';
import 'package:project/modules/job/services/bid.service.dart';
import 'package:project/modules/job/services/job.service.dart';

class JobDetailsProvider extends AppProvider {
  final _jobService = inject.get<JobService>();
  final _bidService = inject.get<BidService>();
  Job? _jobDetails;
  bool _loading = false;
  BaseException? _error;
  late JobsProvider _jobsProvider;

  Job? get jobDetails => _jobDetails;

  bool get loading => _loading;

  BaseException? get error => _error;

  JobDetailsProvider(BuildContext context) : super(context);

  void update(JobsProvider provider) {
    _jobsProvider = provider;
  }

  Future<void> getJobDetails(int jobId) async {
    _loading = true;
    _error = null;
    notify('getJobDetails', notificationType: NotificationType.Start);
    try {
      _jobDetails = await _jobService.getDetails(jobId);
      _jobDetails?.bids = await _bidService.getBids(jobId, 0, 100);
      _loading = false;
      if (_jobDetails != null) {
        _jobsProvider.updateJob(_jobDetails!);
      }

      notify('getJobDetails', notificationType: NotificationType.Success);
    } on BaseException catch (e) {
      _error = e;
      _loading = false;
      notify('getJobDetails', notificationType: NotificationType.Failure);
    }
  }
}
