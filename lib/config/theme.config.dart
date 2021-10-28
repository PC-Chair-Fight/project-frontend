import 'package:flutter/material.dart';

class ThemeConfig extends InheritedWidget {
  final Widget child;
  final Brightness _brightness;
  final Color _primaryColor;
  final Color _primaryColorVariant;
  final Color _onPrimaryColor;
  final Color _secondaryColor;
  final Color _secondaryColorVariant;
  final Color _onSecondaryColor;
  final Color _backgroundColor;
  final Color _onBackgroundColor;
  final Color _surfaceColor;
  final Color _onSurfaceColor;
  final Color _errorColor;
  final Color _onErrorColor;

  ThemeConfig({
    Key? key,
    required this.child,
  })  : _brightness = Brightness.light,
        _primaryColor = const Color(0xFFFFAE00),
        _primaryColorVariant = const Color(0xFFC3890B),
        _onPrimaryColor = const Color(0xFFFFFFFF),
        _secondaryColor = const Color(0xFF00B7FF),
        _secondaryColorVariant = const Color(0xFF1179A9),
        _onSecondaryColor = const Color(0xFFFFFFFF),
        _backgroundColor = const Color(0xFFF0F0F0),
        _onBackgroundColor = const Color(0xFF333333),
        _surfaceColor = const Color(0xFFFFFFFF),
        _onSurfaceColor = const Color(0xFF333333),
        _errorColor = const Color(0xFFF87878),
        _onErrorColor = const Color(0xFFF51B1B),
        super(key: key, child: child);

  static ThemeConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  ThemeData buildThemeData() => ThemeData.from(
        colorScheme: ColorScheme(
          brightness: _brightness,
          primary: _primaryColor,
          primaryVariant: _primaryColorVariant,
          onPrimary: _onPrimaryColor,
          secondary: _secondaryColor,
          secondaryVariant: _secondaryColorVariant,
          onSecondary: _onSecondaryColor,
          background: _backgroundColor,
          onBackground: _onBackgroundColor,
          surface: _surfaceColor,
          onSurface: _onSurfaceColor,
          error: _errorColor,
          onError: _onErrorColor,
        ),
      ).copyWith(
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );
}
