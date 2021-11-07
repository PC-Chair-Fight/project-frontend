import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  final Widget child;
  final bool logProviders;
  final bool logServices;
  final String authBaseUrl;

  const AppConfig({
    Key? key,
    required this.child,
  })  : logProviders = true,
        logServices = true,
        authBaseUrl = 'http://YOUR_URL_HERE', // TODO - Add your base url here
        super(key: key, child: child);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
