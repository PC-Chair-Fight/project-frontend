import 'package:flutter/cupertino.dart';
import 'package:project/modules/user/models/user.model.dart';

class UserProfile extends StatefulWidget{
  final User activeUser;

  const UserProfile({Key? key, required User this.activeUser}) : super(key: key);


  @override
  State<UserProfile> createState() => _UserProfileState();
}


class _UserProfileState extends State<UserProfile>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}