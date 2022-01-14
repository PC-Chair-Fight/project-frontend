import 'package:project/core/exceptions/json_parse.exception.dart';

enum JobFilterField {
  Id,
  Name,
  Description,
  Done,
}

extension ParseFilterField on JobFilterField {
  static JobFilterField fromJson(String json) {
    switch (json) {
      case 'Id':
        return JobFilterField.Id;
      case 'Name':
        return JobFilterField.Name;
      case 'Description':
        return JobFilterField.Description;
      case 'Done':
        return JobFilterField.Done;
      default:
        throw JsonParseException();
    }
  }

  String toJson() {
    switch (this) {
      case JobFilterField.Id:
        return 'Id';
      case JobFilterField.Name:
        return 'Name';
      case JobFilterField.Description:
        return 'Description';
      case JobFilterField.Done:
        return 'Done';
    }
  }
}
