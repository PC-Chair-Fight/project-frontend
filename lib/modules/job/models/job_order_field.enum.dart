import 'package:project/core/exceptions/json_parse.exception.dart';

enum JobOrderField {
  Id,
  Name,
  Description,
  PostDate,
}

extension ParseFilterField on JobOrderField {
  static JobOrderField fromJson(String json) {
    switch (json) {
      case 'Id':
        return JobOrderField.Id;
      case 'Name':
        return JobOrderField.Name;
      case 'Description':
        return JobOrderField.Description;
      case 'PostDate':
        return JobOrderField.PostDate;
      default:
        throw JsonParseException();
    }
  }

  String toJson() {
    switch (this) {
      case JobOrderField.Id:
        return 'Id';
      case JobOrderField.Name:
        return 'Name';
      case JobOrderField.Description:
        return 'Description';
      case JobOrderField.PostDate:
        return 'PostDate';
    }
  }
}
