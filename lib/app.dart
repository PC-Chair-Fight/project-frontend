import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/modules/auth/screens/login.screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project', // TODO - Internationalize using intl
      routes: {
        LoginScreen.route: (context) => LoginScreen(),
      },
      initialRoute: LoginScreen.route,
      theme: ThemeConfig.of(context)!.buildThemeData(),
    );
  }
}
