class JobImage {
  int? id;
  String? url;

  JobImage({this.id, this.url});

  JobImage.fromJson(Map<String, dynamic> json):
      id = json['Id'],
      url = json['URL'];

  Map<String, dynamic> toJson() => {
    'Id': id,
    'URL': url
  };
}
