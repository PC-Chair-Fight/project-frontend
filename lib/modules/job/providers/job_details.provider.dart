import 'package:flutter/src/widgets/framework.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/core/app_provider.dart';
import 'package:project/core/exceptions/base.exception.dart';
import 'package:project/modules/job/models/job.model.dart';
import 'package:project/modules/job/services/bid.service.dart';
import 'package:project/modules/job/services/job.service.dart';

class JobDetailsProvider extends AppProvider {
  final _jobService = inject.get<JobService>();
  final _bidService = inject.get<BidService>();
  JobModel? _jobDetails;
  bool _loading = false;
  BaseException? _error;

  JobModel? get jobDetails => _jobDetails;

  bool get loading => _loading;

  BaseException? get error => _error;

  JobDetailsProvider(BuildContext context) : super(context);

  Future<void> getJobDetails(int jobId) async {
    _loading = true;
    _error = null;
    notify('getJobDetails', notificationType: NotificationType.Start);
    try {
      _jobDetails = await _jobService.getDetails(jobId);
      _jobDetails?.bids = await _bidService.getBids(jobId);
      _loading = false;
      notify('getJobDetails', notificationType: NotificationType.Success);
    } on BaseException catch (e) {
      _error = e;
      _loading = false;
      notify('getJobDetails', notificationType: NotificationType.Failure);
    }
  }
}