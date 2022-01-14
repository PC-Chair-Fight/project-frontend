import 'package:dio/dio.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/core/exceptions/connection_timed_out.exception.dart';
import 'package:project/core/exceptions/invalid_login_credentials.exception.dart';
import 'package:project/core/exceptions/register_conflict.exception.dart';
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
    return initializeDio()
        .post('/Auth/Login', data: {'email': email, 'password': password})
        .then((response) => response.data['token'] as String)
        .catchError((dioError) {
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

  Future<String> register(String firstName, String lastName, String email,
      DateTime dateOfBirth, String password) {
    return initializeDio()
        .post('/Auth/Register', data: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
          'dateOfBirth': dateOfBirth.toIso8601String()
        })
        .then((response) => response.data['token'] as String)
        .catchError((dioError) {
          switch (dioError.runtimeType) {
            case DioError:
              switch (dioError.response?.statusCode) {
                case null:
                  throw ConnectionTimedOutException();
                case 409:
                  throw RegisterConflictException();
                default:
                  throw UnexpectedException();
              }
            default:
              throw UnexpectedException();
          }
        });
  }
}
