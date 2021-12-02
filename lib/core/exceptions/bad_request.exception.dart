import 'package:project/core/exceptions/base.exception.dart';
import 'package:project/generated/l10n.dart';

class BadRequestException extends BaseException {
  BadRequestException()
      : super(S.current.Exception_bad_request);
}
