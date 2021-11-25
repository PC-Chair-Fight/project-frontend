import 'package:dio/dio.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/core/exceptions/connection_timed_out.exception.dart';
import 'package:project/core/exceptions/not_found.exception.dart';
import 'package:project/core/exceptions/server_side_validation.exception.dart';
import 'package:project/core/exceptions/unexpected.exception.dart';
import 'package:project/modules/job/models/job.model.dart';

class JobService {
  final _dio = inject.get<Dio>();
  final String jobBaseUrl;

  JobService(this.jobBaseUrl);

  Dio initializeDio() {
    final dioOptions = _dio.options;
    dioOptions.baseUrl = jobBaseUrl;
    _dio.options = dioOptions;
    return _dio;
  }

  Future<JobModel> getDetails(int jobId) async =>
      initializeDio() // TODO uncomment this when we have jobs
          .get('/Job/Details', queryParameters: {'id': jobId})
          .then((response) => JobModel.fromJson(response.data))
          .catchError(
            (error) {
              switch (error.runtimeType) {
                case DioError:
                  switch (error.response?.statusCode) {
                    case null:
                      throw ConnectionTimedOutException();
                    case 400:
                      throw ServerSideValidationException.fromJson(
                        error.response.data,
                      );
                    case 404:
                      throw NotFoundException();
                    default:
                      throw UnexpectedException();
                  }
                default:
                  throw UnexpectedException();
              }
            },
          );
}
