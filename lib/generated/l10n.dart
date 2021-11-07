// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `en`
  String get _locale {
    return Intl.message(
      'en',
      name: '_locale',
      desc: '',
      args: [],
    );
  }

  /// `PC Project`
  String get App_title {
    return Intl.message(
      'PC Project',
      name: 'App_title',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error... Please try again later`
  String get Exception_unexpected {
    return Intl.message(
      'Unexpected error... Please try again later',
      name: 'Exception_unexpected',
      desc: '',
      args: [],
    );
  }

  /// `Connection timed out... Check your internet connection and try again`
  String get Exception_connection_timed_out {
    return Intl.message(
      'Connection timed out... Check your internet connection and try again',
      name: 'Exception_connection_timed_out',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password`
  String get Exception_invalid_login_credentials {
    return Intl.message(
      'Invalid email or password',
      name: 'Exception_invalid_login_credentials',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get LoginScreen_welcome {
    return Intl.message(
      'Welcome',
      name: 'LoginScreen_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get LoginScreen_email_input_label {
    return Intl.message(
      'Email',
      name: 'LoginScreen_email_input_label',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get LoginScreen_password_input_label {
    return Intl.message(
      'Password',
      name: 'LoginScreen_password_input_label',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get LoginScreen_login_button {
    return Intl.message(
      'Login',
      name: 'LoginScreen_login_button',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get LoginScreen_or {
    return Intl.message(
      'OR',
      name: 'LoginScreen_or',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get LoginScreen_register_button {
    return Intl.message(
      'Register',
      name: 'LoginScreen_register_button',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get LoginScreen_google_button {
    return Intl.message(
      'Continue with Google',
      name: 'LoginScreen_google_button',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Facebook`
  String get LoginScreen_facebook_button {
    return Intl.message(
      'Continue with Facebook',
      name: 'LoginScreen_facebook_button',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an email`
  String get LoginScreen_validator_email_required {
    return Intl.message(
      'Please enter an email',
      name: 'LoginScreen_validator_email_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a password`
  String get LoginScreen_validator_password_required {
    return Intl.message(
      'Please enter a password',
      name: 'LoginScreen_validator_password_required',
      desc: '',
      args: [],
    );
  }

  /// `Authentication successful`
  String get LoginScreen_success {
    return Intl.message(
      'Authentication successful',
      name: 'LoginScreen_success',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a password`
  String get LoginScreen_error_generic {
    return Intl.message(
      'Please enter a password',
      name: 'LoginScreen_error_generic',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
