import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';

class LabeledDivider extends StatelessWidget {
  final Widget label;

  const LabeledDivider({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ThemeConfig.of(context).mediumSpacing,
          ),
          child: DefaultTextStyle(
            child: label,
            style: ThemeConfig.of(context).caption,
          ),
        ),
        Expanded(child: Divider())
      ],
    );
  }
}
