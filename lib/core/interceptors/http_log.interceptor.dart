import 'dart:developer';

import 'package:dio/dio.dart';

class HttpLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log(
      '${options.method} ${options.path}',
      name: 'http',
      time: DateTime.now(),
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(
      '${response.requestOptions.method} ${response.requestOptions.path}: ${response.statusCode} - ${response.statusMessage}',
      name: 'http',
      time: DateTime.now(),
    );
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log(
      '${err.requestOptions.method} ${err.requestOptions.path}: ${err.response?.statusCode ?? '000'} - ${err.response?.statusMessage ?? 'No message'}',
      name: 'http',
      time: DateTime.now(),
    );
    handler.next(err);
  }
}
