import 'package:project/core/exceptions/base.exception.dart';
import 'package:project/generated/l10n.dart';

class InvalidLoginCredentials extends BaseException {
  InvalidLoginCredentials()
      : super(S.current.Exception_invalid_login_credentials);
}
