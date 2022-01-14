import 'package:flutter/src/widgets/framework.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/core/app_provider.dart';
import 'package:project/core/exceptions/base.exception.dart';
import 'package:project/modules/auth/services/auth.service.dart';
import 'package:project/modules/shared/utils/shared_preferences.utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends AppProvider {
  final _sharedPrefs = inject.getAsync<SharedPreferences>();

  AuthProvider(BuildContext context) : super(context);

  String? authToken = null;
  bool loading = false;
  BaseException? error = null;
  AuthService authService = inject.get<AuthService>();

  Future<void> login(String email, String password) async {
    loading = true;
    error = null;
    authToken = null;
    notify('login', notificationType: NotificationType.Start);
    return await authService.login(email, password).then((token) async {
      await _sharedPrefs.then((sharedPrefs) =>
          sharedPrefs.setString(StorageKeys.AUTH_TOKEN, token));
      authToken = token;
      loading = false;
      notify('login', notificationType: NotificationType.Success);
    }).catchError((err) {
      error = err;
      loading = false;
      notify('login', notificationType: NotificationType.Failure);
    });
  }

  Future<void> register(String firstName, String lastName, String email,
      DateTime dateOfBirth, String password) async {
    loading = true;
    error = null;
    authToken = null;
    notify('register', notificationType: NotificationType.Start);
    return await authService
        .register(firstName, lastName, email, dateOfBirth, password)
        .then((token) async {
      await _sharedPrefs.then((sharedPrefs) =>
          sharedPrefs.setString(StorageKeys.AUTH_TOKEN, token));
      authToken = token;
      loading = false;
      notify('register', notificationType: NotificationType.Success);
    }).catchError((err) {
      error = err;
      loading = false;
      notify('register', notificationType: NotificationType.Failure);
    });
  }

  Future<void> logout() async {
    notify('logout', notificationType: NotificationType.Start);
    await _sharedPrefs.then((sharedPrefs) => sharedPrefs.clear());
    authToken = null;
    notify('logout', notificationType: NotificationType.Success);
  }
}
