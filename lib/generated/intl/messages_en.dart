// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "App_title": MessageLookupByLibrary.simpleMessage("PC Project"),
        "Exception_connection_timed_out": MessageLookupByLibrary.simpleMessage(
            "Connection timed out... Check your internet connection and try again"),
        "Exception_invalid_login_credentials":
            MessageLookupByLibrary.simpleMessage("Invalid email or password"),
        "Exception_unexpected": MessageLookupByLibrary.simpleMessage(
            "Unexpected error... Please try again later"),
        "LoginScreen_email_input_label":
            MessageLookupByLibrary.simpleMessage("Email"),
        "LoginScreen_error_generic":
            MessageLookupByLibrary.simpleMessage("Please enter a password"),
        "LoginScreen_facebook_button":
            MessageLookupByLibrary.simpleMessage("Continue with Facebook"),
        "LoginScreen_google_button":
            MessageLookupByLibrary.simpleMessage("Continue with Google"),
        "LoginScreen_login_button":
            MessageLookupByLibrary.simpleMessage("Login"),
        "LoginScreen_or": MessageLookupByLibrary.simpleMessage("OR"),
        "LoginScreen_password_input_label":
            MessageLookupByLibrary.simpleMessage("Password"),
        "LoginScreen_register_button":
            MessageLookupByLibrary.simpleMessage("Register"),
        "LoginScreen_success":
            MessageLookupByLibrary.simpleMessage("Authentication successful"),
        "LoginScreen_title": MessageLookupByLibrary.simpleMessage("PC Project"),
        "LoginScreen_validator_email_required":
            MessageLookupByLibrary.simpleMessage("Please enter an email"),
        "LoginScreen_validator_password_required":
            MessageLookupByLibrary.simpleMessage("Please enter a password"),
        "RegisterScreen_back_to_login_button":
            MessageLookupByLibrary.simpleMessage("Back to login"),
        "RegisterScreen_confirm_password_does_not_match":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "RegisterScreen_confirm_password_input_label":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "RegisterScreen_confirm_password_required":
            MessageLookupByLibrary.simpleMessage(
                "Please confirm your password"),
        "RegisterScreen_date_of_birth_input_label":
            MessageLookupByLibrary.simpleMessage("Date of birth"),
        "RegisterScreen_date_of_birth_required":
            MessageLookupByLibrary.simpleMessage(
                "Please enter a date of birth"),
        "RegisterScreen_email_input_label":
            MessageLookupByLibrary.simpleMessage("Email"),
        "RegisterScreen_email_required":
            MessageLookupByLibrary.simpleMessage("Please enter an email"),
        "RegisterScreen_password_input_label":
            MessageLookupByLibrary.simpleMessage("Password"),
        "RegisterScreen_password_no_special_characters":
            MessageLookupByLibrary.simpleMessage(
                "Password must contain at least 1 special character"),
        "RegisterScreen_password_required":
            MessageLookupByLibrary.simpleMessage("Please enter a password"),
        "RegisterScreen_password_too_short":
            MessageLookupByLibrary.simpleMessage(
                "Password must contain at least 3 characters"),
        "RegisterScreen_register_button":
            MessageLookupByLibrary.simpleMessage("Register"),
        "RegisterScreen_success": MessageLookupByLibrary.simpleMessage(
            "Account created successfully"),
        "RegisterScreen_username_input_label":
            MessageLookupByLibrary.simpleMessage("Username"),
        "RegisterScreen_username_required":
            MessageLookupByLibrary.simpleMessage("Please enter a username")
      };
}