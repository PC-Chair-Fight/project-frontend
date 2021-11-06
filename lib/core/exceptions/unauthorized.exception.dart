import 'package:project/core/exceptions/base.exception.dart';

class UnauthorizedException extends BaseException {
  UnauthorizedException([String message = 'Unauthorized for that action'])
      : super(message);
}
