import 'package:project/core/exceptions/base.exception.dart';
import 'package:project/generated/l10n.dart';

class NotFoundException extends BaseException {
  NotFoundException()
      : super(S.current.Exception_not_found);
}
