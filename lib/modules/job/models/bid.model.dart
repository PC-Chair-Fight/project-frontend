import 'package:project/modules/worker/models/worker.model.dart';

class Bid {
  int? id;
  double? sum;
  Worker? worker;

  Bid({this.id, this.sum, this.worker});

  Bid.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        sum = (json['sum'] as num).toDouble(),
        worker =
            json['worker'] != null ? Worker.fromJson(json['worker']) : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'sum': sum,
        'worker': worker?.toJson(),
      };
}
