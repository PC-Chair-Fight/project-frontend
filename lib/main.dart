import 'package:flutter/material.dart';
import 'package:project/app.dart';
import 'package:project/config/app.config.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/config/provider.config.dart';
import 'package:project/config/theme.config.dart';

void main() {
  final configuredApp = AppConfig(
    child: ProviderConfig(
      child: ThemeConfig(
        child: App(),
      ),
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjection(configuredApp);
  runApp(configuredApp);
}
