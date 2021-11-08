import 'package:dio/dio.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/core/exceptions/connection_timed_out.exception.dart';
import 'package:project/core/exceptions/invalid_login_cedentials.exception.dart';
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
            case null:
              throw ConnectionTimedOutException();
            case (404):
              throw InvalidLoginCredentials();
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
            case null:
              throw ConnectionTimedOutException();
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
}
