import 'package:dio/dio.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/core/exceptions/unauthorized.exception.dart';
import 'package:project/core/exceptions/unexpected.exception.dart';

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

  Future<String> login(String email, String password) {
    return initializeDio().post("public/login",
        data: {'email': email, 'password': password}).then((res) {
      //here we will set the auth token/res
      return '';
    }).catchError((dioError) {
      switch (dioError.runtimeType) {
        case DioError:
          switch (dioError.response?.statusCode) {
            case (404):
              throw UnauthorizedException();
            default:
              throw UnexpectedException();
          }
        default:
          throw UnexpectedException();
      }
    });
  }

  Future<void> register(
      String username, String email, DateTime dateOfBirth, String password) {
    return initializeDio().post('/public/register', data: {
      'username': username,
      'email': email,
      'password': password,
      'dateOfBirth': dateOfBirth.toIso8601String()
    }).catchError((dioError) {
      // no need to parse a result, the method not throwing means the user was registered
      switch (dioError.runtimeType) {
        case DioError:
          switch (dioError.response?.statusCode) {
            case (404):
              throw UnauthorizedException();
            default:
              /* TODO parse additional errors that the backend may send
                 e.g. email already exists */
              throw UnexpectedException();
          }
        default:
          throw UnexpectedException();
      }
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
