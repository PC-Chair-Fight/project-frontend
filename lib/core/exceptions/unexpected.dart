import 'package:project/core/exceptions/baseException.dart';

class UnexpectedException extends BaseException {
  UnexpectedException([String message = 'An unexpected error occurred'])
      : super(message);
}
