import 'package:project/modules/user/models/user.model.dart';

class Worker {
  User? user;
  DateTime? workerSince;

  Worker({this.user, this.workerSince});

  Worker.fromJson(Map<String, dynamic> json)
      : user = json.containsKey('user') ? User.fromJson(json['user']) : null,
        workerSince = json.containsKey('workerSince')
            ? DateTime.parse(json['workerSince'])
            : null;

  Map<String, dynamic> toJson() =>
      {'user': user?.toJson(), 'workerSince': workerSince?.toIso8601String()};
}
