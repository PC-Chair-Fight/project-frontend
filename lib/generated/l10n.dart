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

  /// `The server had trouble processing your request... Please try again later`
  String get Exception_bad_request {
    return Intl.message(
      'The server had trouble processing your request... Please try again later',
      name: 'Exception_bad_request',
      desc: '',
      args: [],
    );
  }

  /// `You are not allowed to perform this action`
  String get Exception_unauthorized {
    return Intl.message(
      'You are not allowed to perform this action',
      name: 'Exception_unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `Item not found`
  String get Exception_not_found {
    return Intl.message(
      'Item not found',
      name: 'Exception_not_found',
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

  /// `Jobs`
  String get Navigation_jobs_page_label {
    return Intl.message(
      'Jobs',
      name: 'Navigation_jobs_page_label',
      desc: '',
      args: [],
    );
  }

  /// `Workers`
  String get Navigation_workers_page_label {
    return Intl.message(
      'Workers',
      name: 'Navigation_workers_page_label',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Navigation_profile_page_label {
    return Intl.message(
      'Profile',
      name: 'Navigation_profile_page_label',
      desc: '',
      args: [],
    );
  }

  /// `PC Project`
  String get LoginScreen_title {
    return Intl.message(
      'PC Project',
      name: 'LoginScreen_title',
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

  /// `First name`
  String get RegisterScreen_first_name_input_label {
    return Intl.message(
      'First name',
      name: 'RegisterScreen_first_name_input_label',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get RegisterScreen_last_name_input_label {
    return Intl.message(
      'Last name',
      name: 'RegisterScreen_last_name_input_label',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get RegisterScreen_email_input_label {
    return Intl.message(
      'Email',
      name: 'RegisterScreen_email_input_label',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get RegisterScreen_date_of_birth_input_label {
    return Intl.message(
      'Date of birth',
      name: 'RegisterScreen_date_of_birth_input_label',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get RegisterScreen_password_input_label {
    return Intl.message(
      'Password',
      name: 'RegisterScreen_password_input_label',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get RegisterScreen_confirm_password_input_label {
    return Intl.message(
      'Confirm password',
      name: 'RegisterScreen_confirm_password_input_label',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get RegisterScreen_register_button {
    return Intl.message(
      'Register',
      name: 'RegisterScreen_register_button',
      desc: '',
      args: [],
    );
  }

  /// `Back to login`
  String get RegisterScreen_back_to_login_button {
    return Intl.message(
      'Back to login',
      name: 'RegisterScreen_back_to_login_button',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your first name`
  String get RegisterScreen_first_name_required {
    return Intl.message(
      'Please enter your first name',
      name: 'RegisterScreen_first_name_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your last name`
  String get RegisterScreen_last_name_required {
    return Intl.message(
      'Please enter your last name',
      name: 'RegisterScreen_last_name_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an email`
  String get RegisterScreen_email_required {
    return Intl.message(
      'Please enter an email',
      name: 'RegisterScreen_email_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a date of birth`
  String get RegisterScreen_date_of_birth_required {
    return Intl.message(
      'Please enter a date of birth',
      name: 'RegisterScreen_date_of_birth_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a password`
  String get RegisterScreen_password_required {
    return Intl.message(
      'Please enter a password',
      name: 'RegisterScreen_password_required',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 3 characters`
  String get RegisterScreen_password_too_short {
    return Intl.message(
      'Password must contain at least 3 characters',
      name: 'RegisterScreen_password_too_short',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 1 special character`
  String get RegisterScreen_password_no_special_characters {
    return Intl.message(
      'Password must contain at least 1 special character',
      name: 'RegisterScreen_password_no_special_characters',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get RegisterScreen_confirm_password_required {
    return Intl.message(
      'Please confirm your password',
      name: 'RegisterScreen_confirm_password_required',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get RegisterScreen_confirm_password_does_not_match {
    return Intl.message(
      'Passwords do not match',
      name: 'RegisterScreen_confirm_password_does_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Account created successfully`
  String get RegisterScreen_success {
    return Intl.message(
      'Account created successfully',
      name: 'RegisterScreen_success',
      desc: '',
      args: [],
    );
  }

  /// `Job Details`
  String get JobDetailsScreen_title {
    return Intl.message(
      'Job Details',
      name: 'JobDetailsScreen_title',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get JobDetailsScreen_name {
    return Intl.message(
      'Name',
      name: 'JobDetailsScreen_name',
      desc: '',
      args: [],
    );
  }

  /// `(No name)`
  String get JobDetailsScreen_no_name {
    return Intl.message(
      '(No name)',
      name: 'JobDetailsScreen_no_name',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get JobDetailsScreen_description {
    return Intl.message(
      'Description',
      name: 'JobDetailsScreen_description',
      desc: '',
      args: [],
    );
  }

  /// `(No description)`
  String get JobDetailsScreen_no_description {
    return Intl.message(
      '(No description)',
      name: 'JobDetailsScreen_no_description',
      desc: '',
      args: [],
    );
  }

  /// `Show more`
  String get JobDetailsScreen_show_more {
    return Intl.message(
      'Show more',
      name: 'JobDetailsScreen_show_more',
      desc: '',
      args: [],
    );
  }

  /// `Show less`
  String get JobDetailsScreen_show_less {
    return Intl.message(
      'Show less',
      name: 'JobDetailsScreen_show_less',
      desc: '',
      args: [],
    );
  }

  /// `Bid`
  String get JobDetailsScreen_bid_button {
    return Intl.message(
      'Bid',
      name: 'JobDetailsScreen_bid_button',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get JobSortFilterCard_clearButton {
    return Intl.message(
      'Clear',
      name: 'JobSortFilterCard_clearButton',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get JobSortFilterCard_applyButton {
    return Intl.message(
      'Apply',
      name: 'JobSortFilterCard_applyButton',
      desc: '',
      args: [],
    );
  }

  /// `Deadline date range`
  String get JobSortFilterCard_deadlineDateRange {
    return Intl.message(
      'Deadline date range',
      name: 'JobSortFilterCard_deadlineDateRange',
      desc: '',
      args: [],
    );
  }

  /// `Post date range`
  String get JobSortFilterCard_postDateRange {
    return Intl.message(
      'Post date range',
      name: 'JobSortFilterCard_postDateRange',
      desc: '',
      args: [],
    );
  }

  /// `Filter Jobs`
  String get JobSortFilterCard_filterJobs {
    return Intl.message(
      'Filter Jobs',
      name: 'JobSortFilterCard_filterJobs',
      desc: '',
      args: [],
    );
  }

  /// `Ascending`
  String get JobSortFilterCard_ascending {
    return Intl.message(
      'Ascending',
      name: 'JobSortFilterCard_ascending',
      desc: '',
      args: [],
    );
  }

  /// `Sort Jobs`
  String get JobSortFilterCard_sortJobs {
    return Intl.message(
      'Sort Jobs',
      name: 'JobSortFilterCard_sortJobs',
      desc: '',
      args: [],
    );
  }

  /// `Posted by`
  String get JobCard_postedBy {
    return Intl.message(
      'Posted by',
      name: 'JobCard_postedBy',
      desc: '',
      args: [],
    );
  }

  /// `on`
  String get JobCard_onString {
    return Intl.message(
      'on',
      name: 'JobCard_onString',
      desc: '',
      args: [],
    );
  }

  /// `See Job Details`
  String get JobsCard_seeJobDetails {
    return Intl.message(
      'See Job Details',
      name: 'JobsCard_seeJobDetails',
      desc: '',
      args: [],
    );
  }

  /// `Search field...`
  String get JobsDashboardScreen_search {
    return Intl.message(
      'Search field...',
      name: 'JobsDashboardScreen_search',
      desc: '',
      args: [],
    );
  }

  /// `Post a Job`
  String get JobsDashboardScreen_postJob {
    return Intl.message(
      'Post a Job',
      name: 'JobsDashboardScreen_postJob',
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
