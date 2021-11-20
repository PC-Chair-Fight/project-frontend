class Bid {
  int? id;
  double? sum;
  int? workerId;

  Bid.fromJson(Map<String, dynamic> json):
      id = json['Id'],
      sum = json['Sum'],
      workerId = json['WorkerId'];

  Map<String, dynamic> toJson() => {
    'Id': id,
    'Sum': sum,
    'WorkerId': workerId
  };
}
