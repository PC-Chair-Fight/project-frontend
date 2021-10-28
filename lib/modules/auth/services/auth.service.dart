import 'package:dio/dio.dart';
import 'package:project/config/inject.config.dart';

class AuthService {
  final _dio = inject.get<Dio>();
  final String authBaseUrl;

  AuthService(this.authBaseUrl);

  Dio initializeDio() {
    final dioOptions = _dio.options;
    dioOptions.baseUrl = authBaseUrl;
    _dio.options = dioOptions;
    return _dio;
  }

// TODO - Implement API calls
// Use Dio for API calls
// Example:
// Future<RESPONSE_MODEL> login(REQUEST_MODEL) {
//     return initializeDio()
//         .get('/auth/login', data: {...}, ...)
//         .then((response) {...}) // Parse the response data into the appropriate response model
//         .catchError(
//             (error) {...},  // Parse the DioError into the appropriate app exception
//             test: (error) error is DioError
//         );
// }
}
