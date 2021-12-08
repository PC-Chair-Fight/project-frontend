import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/modules/shared/widgets/loading_indicator.widget.dart';
import 'package:project/modules/user/providers/user_profile.provider.dart';
import 'package:project/modules/user/widgets/user_profile.widget.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  static const String route = '/user';

  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late UserProfileProvider _userProfileProvider;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final userId = ModalRoute.of(context)?.settings.arguments as int?;
      if (userId == null) Navigator.pop(context);
      _userProfileProvider.getUser(
        userId!,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _userProfileProvider = Provider.of<UserProfileProvider>(context);
    if (_userProfileProvider.error != null) {
      Navigator.pop(context); //TODO error screen
    }
    return Scaffold(
      body: _userProfileProvider.loading
          ? Center(
              child: LoadingIndicator(
                type: LoadingIndicatorType.Page,
              ),
            )
          : UserProfile(
              activeUser: _userProfileProvider.activeUser!,
            ),
    );
  }
}
