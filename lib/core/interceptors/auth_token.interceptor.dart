import 'package:dio/dio.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/modules/shared/utils/shared_preferences.utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthTokenInterceptor extends Interceptor {
  final Future<SharedPreferences> _prefs = inject.getAsync<SharedPreferences>();

  void onRequest(request, handler) async {
    final token = await (await _prefs).getString(SharedPreferencesUtils.AUTH_TOKEN_KEY);
    if (token != null && token != '') {
      request.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(request);
  }
}
