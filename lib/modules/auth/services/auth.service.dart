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

  Future<bool> login(String email, String password) {
    return initializeDio().post("public/login", data: {email, password}).then((res) {
      //here we will set the auth token/res
      return true;
    });
  }
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
