import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/auth/screens/login.screen.dart';
import 'package:project/modules/auth/screens/register.screen.dart';
import 'package:project/modules/job/screens/job_details.screen.dart';
import 'package:project/modules/job/screens/jobs_dashboard.screen.dart';
import 'package:project/modules/user/screens/user_profile.screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => S.of(context).App_title,
      routes: {
        LoginScreen.route: (context) => LoginScreen(),
        RegisterScreen.route: (context) => RegisterScreen(),
        JobsDashboardScreen.route: (context) => JobsDashboardScreen(),
        JobDetailsScreen.route: (context) => JobDetailsScreen(),
        UserProfileScreen.route: (context) => UserProfileScreen()
      },
      initialRoute: LoginScreen.route,
      theme: ThemeConfig.of(context).buildThemeData(),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
    );
  }
}
