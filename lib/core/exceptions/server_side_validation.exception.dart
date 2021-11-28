import 'package:project/core/exceptions/base.exception.dart';
import 'package:project/generated/l10n.dart';

/// the same type as "ValidationProblemDetails" on the server; see
/// [this doc](https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.validationproblemdetails?view=aspnetcore-5.0)
class ServerSideValidationException extends BaseException {
  final String type;
  final String title;
  final int status;
  final String detail;
  final String instance;
  final Map<String, List<String>> errors;
  final Map<String, String> additionalProperties;

  ServerSideValidationException.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        title = json['title'],
        status = json['status'],
        detail = json['detail'],
        instance = json['instance'],
        errors = json['errors'],
        additionalProperties = (json
          ..remove('type')
          ..remove('title')
          ..remove('status')
          ..remove('detail')
          ..remove('instance')
          ..remove('errors')) as Map<String, String>,
        super(S.current.Exception_bad_request)
  {}
}
