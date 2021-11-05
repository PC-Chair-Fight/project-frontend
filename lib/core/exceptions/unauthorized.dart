import 'package:project/core/exceptions/baseException.dart';

class UnauthorizedException extends BaseException {
  UnauthorizedException([String message = 'Unauthorized for that action'])
      : super(message);
}
