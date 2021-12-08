import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  final Widget child;
  final bool logProviders;
  final bool logServices;
  final String authBaseUrl;
  final String jobBaseUrl;
  final String bidBaseUrl;
  final String userBaseUrl;

  const AppConfig({
    Key? key,
    required this.child,
  })  : logProviders = true,
        logServices = true,
        authBaseUrl = 'http://192.168.0.144:5001/',
        jobBaseUrl = 'http://192.168.0.144:5001/',
        bidBaseUrl = 'http://192.168.0.144:5001/',
        userBaseUrl = 'http://192.168.0.144:5001/',
        super(key: key, child: child);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
