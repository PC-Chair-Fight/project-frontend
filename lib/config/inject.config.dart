library inject_config;

import 'package:get_it/get_it.dart';
import 'package:project/config/app.config.dart';
import 'package:project/config/dio.config.dart';
import 'package:project/modules/auth/services/auth.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt inject = GetIt.instance;

void setupDependencyInjection(AppConfig configuredApp) async {
  // Core
  inject.registerLazySingletonAsync(() => SharedPreferences.getInstance());
  inject.registerLazySingleton(() => dioInstance(configuredApp));

  // Services
  inject.registerLazySingleton(() => AuthService(configuredApp.authBaseUrl));
}
