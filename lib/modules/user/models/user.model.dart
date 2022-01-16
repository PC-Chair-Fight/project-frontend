class User {
  int? id;
  String? firstName;
  String? lastName;
  DateTime? dateOfBirth;
  String? email;
  String? profilePicture;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.email,
    this.profilePicture,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        dateOfBirth = json['dateOfBirth'] != null
            ? DateTime.parse(json['dateOfBirth'])
            : null,
        email = json['email'],
        profilePicture = json['profilePicture'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'dateOfBirth': dateOfBirth?.toIso8601String(),
        'lastName': lastName,
        'email': email,
        'profilePicture': profilePicture,
      };
}
