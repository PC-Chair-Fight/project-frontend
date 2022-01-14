import 'package:project/core/exceptions/base.exception.dart';
import 'package:project/generated/l10n.dart';

class UnexpectedException extends BaseException {
  UnexpectedException() : super(S.current.Exception_unexpected);
}
