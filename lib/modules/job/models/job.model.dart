import 'package:project/modules/job/models/bid.model.dart';
import 'package:project/modules/user/models/user.model.dart';

class JobModel {
  int? id;
  User? user;
  String? name;
  String? description;
  List<String> images;
  List<Bid> bids;
  DateTime? postDate;
  bool? done;

  JobModel({
    this.id,
    this.name,
    this.description,
    this.images = const [],
    this.bids = const [],
    this.postDate,
    this.done,
  });

  JobModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        images = json['images'] as List<String>? ?? [],
        bids = json['bids'] as List<Bid>? ?? [],
        postDate = DateTime.parse(json['postDate'] as String),
        done = json['done'];

  toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'images': images,
        'bids': bids.map((b) => b.toJson()),
        'postDate': postDate?.toIso8601String(),
        'done': done
      };
}
