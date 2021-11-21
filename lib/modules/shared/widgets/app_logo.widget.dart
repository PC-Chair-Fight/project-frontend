import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO - Replace with the real logo
    return Material(
      color: ThemeConfig.of(context).surfaceColor,
      elevation: 4,
      shape: CircleBorder(),
      child: Padding(
        padding: EdgeInsets.all(ThemeConfig.of(context).appMargin),
        child: FlutterLogo(),
      ),
    );
  }
}
