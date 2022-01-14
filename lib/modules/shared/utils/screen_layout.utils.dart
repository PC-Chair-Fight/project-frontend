import 'package:flutter/cupertino.dart';

class ScreenLayout {
  static bool isSmall(BuildContext context) =>
      MediaQuery.of(context).size.width <= 800;

  static bool isWide(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;
}
