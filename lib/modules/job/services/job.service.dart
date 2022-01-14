import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:image/image.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/core/exceptions/connection_timed_out.exception.dart';
import 'package:project/core/exceptions/not_found.exception.dart';
import 'package:project/core/exceptions/server_side_validation.exception.dart';
import 'package:project/core/exceptions/unexpected.exception.dart';
import 'package:project/modules/job/models/job.model.dart';
import 'package:project/modules/job/models/job_query.model.dart';

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

  Future<Job> getDetails(int jobId) async => initializeDio()
      .get('/Job/Details', queryParameters: {'id': jobId})
      .then((response) => Job.fromJson(response.data))
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

  Future<Job> createJob(
    String name,
    String description,
    List<Uint8List> images,
  ) async {
    final formData = FormData.fromMap({
      'name': name,
      'description': description,
    });
    int requestFileUniqueId = 0;

    await Future.wait(
      images.map(
        (bytes) async {
          final img = decodeImage(bytes);
          if (img == null) return null;
          formData.files.add(
            MapEntry(
              'images',
              await MultipartFile.fromBytes(
                encodeJpg(img),
                filename: (requestFileUniqueId++).toString(),
              ),
            ),
          );
        },
      ),
    );

    return initializeDio()
        .post('/Job/Add', data: formData)
        .then((response) => Job.fromJson(response.data))
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
              default:
                throw UnexpectedException();
            }
          default:
            throw UnexpectedException();
        }
      },
    );
  }

  Future<List<Job>> getJobs(JobQuery query) async => initializeDio()
        .post('/Job', data: query.toJson())
        .then((response) => (response.data['jobs'] as List<dynamic>)
            .map((json) => Job.fromJson(json))
            .toList())
        .catchError((error) {
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
    });
}
