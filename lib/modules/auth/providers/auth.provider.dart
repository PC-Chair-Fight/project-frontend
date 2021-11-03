import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/core/app_provider.dart';
import 'package:project/modules/auth/services/auth.service.dart';

class AuthProvider extends AppProvider {
  AuthProvider(BuildContext context) : super(context);

  Dio dioInstance = inject.get<Dio>();

  String? authToken = null;
  bool loading = false;
  String? error = null;
  AuthService authService = inject.get<AuthService>();

  Future<void> login(String email, String password) {
    loading = true;
    error = null;
    super.notify('Starting authentication',
        notificationType: NotificationType.Start);

    return authService.login(email, password).then((res) {
      //here we will set the auth token
      authToken = 'authToken';
      loading = false;
      super.notify('Authentication successful',
          notificationType: NotificationType.Success);
    }).catchError((err) {
      error = err;
      loading = false;
      super.notify('Authentication failed',
          notificationType: NotificationType.Failure);
    });
  }
}
