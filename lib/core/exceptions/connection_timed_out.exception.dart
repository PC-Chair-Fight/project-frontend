import 'package:project/core/exceptions/base.exception.dart';
import 'package:project/generated/l10n.dart';

class ConnectionTimedOutException extends BaseException {
  ConnectionTimedOutException()
      : super(S.current.Exception_connection_timed_out);
}
