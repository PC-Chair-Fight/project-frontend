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

  Future<JobModel> getDetails(int jobId) async => JobModel(
          id: 0,
          name: 'Name',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          images: [
            'https://picsum.photos/id/1/600',
            'https://picsum.photos/id/2/600',
            'https://picsum.photos/id/3/600',
            'https://picsum.photos/id/4/600',
            'https://picsum.photos/id/5/600',
          ]);
// initializeDio() // TODO uncomment this when we have jobs
// .get('/Job/Details', queryParameters: {'id': jobId})
// .then((response) => JobModel.fromJson(response.data))
// .catchError(
//   (error) {
//     switch (error.runtimeType) {
//       case DioError:
//         switch (error.response?.statusCode) {
//           case null:
//             throw ConnectionTimedOutException();
//           case 400:
//             throw ServerSideValidationException.fromJson(
//               error.response.data,
//             );
//           case 404:
//             throw NotFoundException();
//           default:
//             throw UnexpectedException();
//         }
//       default:
//         throw UnexpectedException();
//     }
//   },
// );
}
