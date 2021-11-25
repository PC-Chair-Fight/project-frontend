import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';

class AppSideNavigationBar extends StatelessWidget {
  const AppSideNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ThemeConfig.of(context).surfaceColor,
      elevation: ThemeConfig.of(context).mediumElevation,
      child: Column(
        children: [
          Material(
            color: ThemeConfig.of(context).primaryColor,
            shadowColor: ThemeConfig.of(context).primaryColor,
            elevation: ThemeConfig.of(context).mediumElevation,
            child: Padding(
              padding: EdgeInsets.all(16),
            ),
          ),
        ],
      ),
    );
  }
}
