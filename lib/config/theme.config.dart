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
  final Color inputFillColor;
  final Color shadowColor;

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
  final double appSmallWidth = 400;
  final double appMediumWidth = 600;
  final double appLargeWidth = 800;
  final double appMargin = 20;
  final double borderRadius = 8;
  final double buttonHeight = 36;
  final double smallestSpacing = 4;
  final double smallSpacing = 8;
  final double mediumSpacing = 16;
  final double largeSpacing = 32;
  final double largestSpacing = 64;

  // Elevations
  final double smallElevation = 2;
  final double mediumElevation = 4;
  final double LargeElevation = 8;

  // Durations
  final Duration fastDuration = new Duration(milliseconds: 100);
  final Duration mediumDuration = new Duration(milliseconds: 300);
  final Duration slowDuration = new Duration(milliseconds: 600);
  final Duration longDuration = new Duration(seconds: 5);

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
        dividerColor = const Color(0xFFD2D2D2),
        inputFillColor = const Color(0xFFEFEFEF),
        shadowColor = const Color(0xFF000000),
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
          height: 1.75,
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
        super(key: key, child: child);

  static ThemeConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeConfig>()!;
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
          background: surfaceColor,
          onBackground: onSurfaceColor,
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
        visualDensity: VisualDensity.standard,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        dividerColor: dividerColor,
        scaffoldBackgroundColor: backgroundColor,
        iconTheme: IconThemeData(
          size: 20,
          color: onBackgroundColor,
        ),
        cardTheme: CardTheme(
          elevation: smallElevation,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
            ),
          ),
        ),
        dividerTheme: DividerThemeData(
          color: dividerColor,
          thickness: 1,
          space: 1,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: appElevatedButtonStyle(),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: appOutlinedButtonStyle(),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            minimumSize: _mpAll(Size.fromRadius(buttonHeight / 2)),
            shape: _mpAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            )),
            textStyle: _mpAll(subtitle2),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          smallSizeConstraints: BoxConstraints.expand(
            width: buttonHeight,
            height: buttonHeight,
          ),
        ),
        inputDecorationTheme: appInputDecorationTheme(),
      );

  ButtonStyle appElevatedButtonStyle() => ButtonStyle(
        backgroundColor: _mpAll(primaryColor),
        foregroundColor: _mpAll(onPrimaryColor),
        shadowColor: _mpAll(primaryColor),
        minimumSize: _mpAll(Size.fromRadius(buttonHeight / 2)),
        shape: _mpAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        )),
      );

  ButtonStyle appElevatedButtonAltStyle() => ButtonStyle(
        backgroundColor: _mpAll(surfaceColor),
        foregroundColor: _mpAll(primaryColor),
        overlayColor: _mpAll(primaryColor.withOpacity(.25)),
        shadowColor: _mpAll(shadowColor),
        minimumSize: _mpAll(Size.fromRadius(buttonHeight / 2)),
        shape: _mpAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        )),
      );

  ButtonStyle appOutlinedButtonStyle() => ButtonStyle(
        foregroundColor: _mpAll(primaryColor),
        minimumSize: _mpAll(Size.fromRadius(buttonHeight / 2)),
        shape: _mpAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        )),
        side: _mpAll(BorderSide(color: primaryColor, width: 1)),
      );

  InputDecorationTheme appInputDecorationTheme() => InputDecorationTheme(
        filled: true,
        fillColor: inputFillColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: mediumSpacing,
          vertical: smallSpacing,
        ),
      );

  InputDecorationTheme appSearchInputDecorationTheme() => InputDecorationTheme(
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: smallSpacing,
          vertical: smallSpacing,
        ),
        fillColor: inputFillColor,
        constraints: BoxConstraints(maxHeight: buttonHeight),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(buttonHeight / 2),
          borderSide: BorderSide.none,
        ),
      );

  // Shorthand
  MaterialStateProperty<T> _mpAll<T>(T value) =>
      MaterialStateProperty.all<T>(value);
}
