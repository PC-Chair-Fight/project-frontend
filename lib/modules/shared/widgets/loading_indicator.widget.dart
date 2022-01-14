import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';

class LoadingIndicator extends StatelessWidget {
  final LoadingIndicatorType type;

  const LoadingIndicator({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case LoadingIndicatorType.Regular:
        return CircularProgressIndicator();
      case LoadingIndicatorType.Button:
      case LoadingIndicatorType.OutlinedButton:
        return SizedBox(
          width: ThemeConfig.of(context).buttonHeight / 2,
          height: ThemeConfig.of(context).buttonHeight / 2,
          child: CircularProgressIndicator(
            color: type == LoadingIndicatorType.Button
                ? ThemeConfig.of(context).onPrimaryColor
                : ThemeConfig.of(context).primaryColor,
          ),
        );
      case LoadingIndicatorType.Page:
        return CircularProgressIndicator();
    }
  }
}

enum LoadingIndicatorType {
  Regular,
  Button,
  OutlinedButton,
  Page,
}
