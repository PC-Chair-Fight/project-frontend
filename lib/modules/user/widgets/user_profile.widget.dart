import 'package:flutter/cupertino.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/modules/user/models/user.model.dart';

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

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: ThemeConfig.of(context).appMargin,
        horizontal: ThemeConfig.of(context).appMargin,
      ),
      child: Column(
        children: [
          Text("User Profile", style: ThemeConfig.of(context).headline4),
          SizedBox(
            height: 72,
            width: 72,
            child: ClipOval(
              child: Image(
                  image: (widget.activeUser.profilePicture == null
                      ? AssetImage('assets/blank-profile-picture.png')
                      : NetworkImage(widget.activeUser.profilePicture!))
                  as ImageProvider),
            ),
          ),
          Text(
            "First Name",
            style: ThemeConfig.of(context).headline5,
          ),
          Text(
            widget.activeUser.firstName!,
            style: ThemeConfig.of(context).headline6,
          ),
          Text(
            "Last Name",
            style: ThemeConfig.of(context).headline5,
          ),
          Text(
            widget.activeUser.lastName!,
            style: ThemeConfig.of(context).headline6,
          ),
          Text(
            "Date of birth",
            style: ThemeConfig.of(context).headline5,
          ),
          Text(
            widget.activeUser.dateOfBirth!.toIso8601String(),
            style: ThemeConfig.of(context).headline6,
          ),
          Text(
            "Email",
            style: ThemeConfig.of(context).headline5,
          ),
          Text(
            widget.activeUser.email!,
            style: ThemeConfig.of(context).headline6,
          ),
        ],
      ),
    );
  }
}
