import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/modules/user/models/user.model.dart';
import 'package:project/modules/user/widgets/user_profile.widget.dart';

class UserProfileScreen extends StatefulWidget {
  static const String route = '/user';

  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   final userId = ModalRoute.of(context)?.settings.arguments as int?;
    //   if (userId == null) Navigator.pop(context);
    //   Provider.of<UserProfileProvider>(context, listen: false).getUser(
    //     userId!,
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<UserProfileProvider>(context);
    // if (provider.error != null) {
    //   Navigator.pop(context); //TODO error screen
    // }
    return Scaffold(
        /*body: provider.loading
            ? Center(
                child: LoadingIndicator(
                  type: LoadingIndicatorType.Page,
                ),
              )
            : UserProfile(activeUser: provider.activeUser!));*/
        body: UserProfile(
            activeUser: User(
                id: 69,
                firstName: 'Vlad-Rares',
                lastName: 'Raducu',
                dateOfBirth: DateTime.utc(2000, 6, 8),
                email: 'vlad101vlad@gmail.com',
                profilePicture:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Mangekyou_Sharingan_Kakashi.svg/2048px-Mangekyou_Sharingan_Kakashi.svg.png')));
  }
}
