import 'dart:ui';

import 'package:flutter/material.dart';

class ThemeConfig extends InheritedWidget {
  final Widget child;

  // Colors
  final Brightness brightness;
  final Color primaryColor;
  final Color primaryColorVariant;
  final Color onPrimaryColor;
  final Color secondaryColor;
  final Color secondaryColorVariant;
  final Color onSecondaryColor;
  final Color backgroundColor;
  final Color onBackgroundColor;
  final Color surfaceColor;
  final Color onSurfaceColor;
  final Color errorColor;
  final Color onErrorColor;
  final Color dividerColor;
  final Color successColor;
  final Color onSuccessColor;

  // Sizes
  final double headline1 = 40;
  final double buttonHeight = 40;
  final double appMargin = 16;
  final double smallestSpacing = 4;
  final double smallSpacing = 8;
  final double mediumSpacing = 16;
  final double largeSpacing = 32;
  final double largestSpacing = 64;

  ThemeConfig({
    Key? key,
    required this.child,
  })  : brightness = Brightness.light,
        primaryColor = const Color(0xFF6200EA),
        primaryColorVariant = const Color(0xFFC3890B),
        onPrimaryColor = const Color(0xFFFFFFFF),
        secondaryColor = const Color(0xFF00B7FF),
        secondaryColorVariant = const Color(0xFF1179A9),
        onSecondaryColor = const Color(0xFFFFFFFF),
        backgroundColor = const Color(0xFFF0F0F0),
        onBackgroundColor = const Color(0xFF333333),
        surfaceColor = const Color(0xFFFFFFFF),
        onSurfaceColor = const Color(0xFF333333),
        errorColor = const Color(0xFFF87878),
        onErrorColor = const Color(0xFFF51B1B),
        successColor = Colors.green.shade200,
        onSuccessColor = Colors.green,
        dividerColor = Color.fromRGBO(153, 153, 153, 1),
        super(key: key, child: child);

  static ThemeConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  ThemeData buildThemeData() => ThemeData.from(
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: primaryColor,
          primaryVariant: primaryColorVariant,
          onPrimary: onPrimaryColor,
          secondary: secondaryColor,
          secondaryVariant: secondaryColorVariant,
          onSecondary: onSecondaryColor,
          background: backgroundColor,
          onBackground: onBackgroundColor,
          surface: surfaceColor,
          onSurface: onSurfaceColor,
          error: errorColor,
          onError: onErrorColor,
        ),
      ).copyWith(
        inputDecorationTheme: const InputDecorationTheme(filled: true),
        dividerColor: dividerColor,
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );
}
