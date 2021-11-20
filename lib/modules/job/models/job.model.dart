import 'package:project/modules/job/models/job_image.model.dart';
import 'package:project/modules/job/models/bid.model.dart';

class Job {
  int? id;
  String? name;
  String? description;
  List<JobImage>? images;
  List<Bid>? bids;
  DateTime? postDate;
  bool? done;

  Job({
    this.id,
    this.name,
    this.description,
    this.images,
    this.bids,
    this.postDate,
    this.done,
  });

  Job.fromJson(Map<String, dynamic> json)
      : id = json['Id'],
        name = json['Name'],
        description = json['Description'],
        images = (json['Images'] as List<Map<String, dynamic>>)
            .map((e) => JobImage.fromJson(e))
            .toList(),
        bids = (json['Bids'] as List<Map<String, dynamic>>)
            .map((e) => Bid.fromJson(e))
            .toList(),
        postDate = DateTime.parse(json['PostDate'] as String),
        done = json['Done'];

  toJson() => {
        'Id': id,
        'Name': name,
        'Description': description,
        'Images': images,
        'Bids': bids,
        'PostDate': postDate?.toIso8601String(),
        'Done': done
      };
}
