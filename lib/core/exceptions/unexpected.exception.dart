import 'package:project/core/exceptions/base.exception.dart';

class UnexpectedException extends BaseException {
  UnexpectedException([String message = 'An unexpected error occurred'])
      : super(message);
}
