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
  final Color successColor;
  final Color onSuccessColor;
  final Color warningColor;
  final Color onWarningColor;
  final Color errorColor;
  final Color onErrorColor;
  final Color dividerColor;

  // Typography
  final TextStyle headline1;
  final TextStyle headline2;
  final TextStyle headline3;
  final TextStyle headline4;
  final TextStyle headline5;
  final TextStyle headline6;
  final TextStyle subtitle1;
  final TextStyle subtitle2;
  final TextStyle body1;
  final TextStyle body2;
  final TextStyle button;
  final TextStyle caption;
  final TextStyle overline;

  // Sizes
  final double appMargin;
  final double borderRadius;
  final double buttonHeight;
  final double smallestSpacing;
  final double smallSpacing;
  final double mediumSpacing;
  final double largeSpacing;
  final double largestSpacing;

  // Durations
  final Duration fastDuration = new Duration(milliseconds: 100);
  final Duration mediumDuration = new Duration(milliseconds: 300);
  final Duration slowDuration = new Duration(milliseconds: 600);

  final double elevation = 4;

  ThemeConfig({
    Key? key,
    required this.child,
  })  : brightness = Brightness.light,
        primaryColor = const Color(0xFF2589D6),
        primaryColorVariant = const Color(0x7F2589D6),
        onPrimaryColor = const Color(0xFFFFFFFF),
        secondaryColor = const Color(0xFF2589D6),
        secondaryColorVariant = const Color(0x7F2589D6),
        onSecondaryColor = const Color(0xFFFFFFFF),
        backgroundColor = const Color(0xFFFAFAFA),
        onBackgroundColor = const Color(0xFF333333),
        surfaceColor = const Color(0xFFFFFFFF),
        onSurfaceColor = const Color(0xFF333333),
        successColor = const Color(0xFF2589D6),
        onSuccessColor = const Color(0xFFFFFFFF),
        warningColor = const Color(0xFFFFB639),
        onWarningColor = const Color(0xFFFFFFFF),
        errorColor = const Color(0xFFF54854),
        onErrorColor = const Color(0xFFFFFFFF),
        dividerColor = const Color(0xFF999999),
        headline1 = TextStyle(
          fontSize: 96,
          fontWeight: FontWeight.w300,
          color: const Color(0xFF333333),
        ),
        headline2 = TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF333333),
        ),
        headline3 = TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF333333),
        ),
        headline4 = TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF333333),
        ),
        headline5 = TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF333333),
        ),
        headline6 = TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF333333),
        ),
        subtitle1 = TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF333333),
        ),
        subtitle2 = TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF333333),
        ),
        body1 = TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF333333),
        ),
        body2 = TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF333333),
        ),
        button = TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF333333),
        ),
        caption = TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF808080),
        ),
        overline = TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF333333),
        ),
        appMargin = 20,
        borderRadius = 8,
        buttonHeight = 36,
        smallestSpacing = 4,
        smallSpacing = 8,
        mediumSpacing = 16,
        largeSpacing = 32,
        largestSpacing = 64,
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
        textTheme: TextTheme(
          headline1: headline1,
          headline2: headline2,
          headline3: headline3,
          headline4: headline4,
          headline5: headline5,
          headline6: headline6,
          subtitle1: subtitle1,
          subtitle2: subtitle2,
          bodyText1: body1,
          bodyText2: body2,
          button: button,
          caption: caption,
          overline: overline,
        ),
      ).copyWith(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        dividerColor: dividerColor,
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryColor),
            foregroundColor: MaterialStateProperty.all(onPrimaryColor),
            shadowColor: MaterialStateProperty.all(primaryColor),
            minimumSize:
                MaterialStateProperty.all(Size.fromRadius(buttonHeight / 2)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(primaryColor),
            minimumSize:
                MaterialStateProperty.all(Size.fromRadius(buttonHeight / 2)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            side: MaterialStateProperty.all(
              BorderSide(
                color: primaryColor,
                width: 1,
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: mediumSpacing,
            vertical: smallSpacing,
          ),
        ),
      );
}
