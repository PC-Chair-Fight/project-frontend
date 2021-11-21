import 'package:project/core/exceptions/base.exception.dart';

class RegisterConflictException extends BaseException {
  RegisterConflictException()
      : super(
            'Tried registering a user with an already registered existing email');
}
