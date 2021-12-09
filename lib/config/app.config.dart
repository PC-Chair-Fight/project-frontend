import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  final Widget child;
  final bool logProviders;
  final bool logServices;
  final String authBaseUrl;
  final String jobBaseUrl;
  final String bidBaseUrl;

  const AppConfig({
    Key? key,
    required this.child,
  })  : logProviders = true,
        logServices = true,
        authBaseUrl = 'http://localhost:5000/',
        jobBaseUrl = 'http://localhost:5000/',
        bidBaseUrl = 'http://localhost:5000/',
        super(key: key, child: child);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
