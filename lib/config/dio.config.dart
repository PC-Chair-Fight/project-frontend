library dio_config;

import 'package:dio/dio.dart';
import 'package:project/config/app.config.dart';
import 'package:project/core/interceptors/auth_token.interceptor.dart';

Dio dioInstance(AppConfig configuredApp) {
  final dio = Dio(BaseOptions(
    headers: {
      Headers.contentTypeHeader: 'application/json',
    },
    connectTimeout: 10000,
    receiveTimeout: 10000,
    sendTimeout: 10000,
  ));

  dio.interceptors.addAll([
    AuthTokenInterceptor(),
    if (configuredApp.logServices) LogInterceptor(),
  ]);

  return dio;
}
