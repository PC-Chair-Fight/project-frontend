import 'package:project/modules/worker/models/worker.model.dart';

class Bid {
  int? id;
  double? sum;
  Worker? worker;

  Bid({this.id, this.sum, this.worker});

  Bid.fromJson(Map<String, dynamic> json)
      : id = json['Id'],
        sum = json['Sum'],
        worker =
            json.containsKey('worker') ? Worker.fromJson(json['worker']) : null;

  Map<String, dynamic> toJson() => {'Id': id, 'Sum': sum, 'worker': worker};
}
