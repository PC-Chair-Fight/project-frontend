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
        authBaseUrl = 'http://chairfightbackend.azurewebsites.net/',
        jobBaseUrl = 'http://chairfightbackend.azurewebsites.net/',
        bidBaseUrl = 'http://chairfightbackend.azurewebsites.net/',
        userBaseUrl = 'http://chairfightbackend.azurewebsites.net/',
        super(key: key, child: child);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
