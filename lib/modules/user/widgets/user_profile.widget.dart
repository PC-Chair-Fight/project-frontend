import 'package:flutter/cupertino.dart';
import 'package:project/modules/user/models/user.model.dart';
import 'package:project/modules/user/providers/user_profile.provider.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  final User activeUser;

  const UserProfile({Key? key, required User this.activeUser})
      : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("User Profile"),
      ],
    );
  }
}
