import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/modules/auth/providers/auth.provider.dart';
import 'package:project/modules/shared/widgets/loading_indicator.widget.dart';
import 'package:project/modules/user/providers/user_profile.provider.dart';
import 'package:project/modules/user/widgets/user_profile.widget.dart';
import 'package:provider/provider.dart';

class CurrentUserProfileScreen extends StatefulWidget {
  static const String route = '/user';

  const CurrentUserProfileScreen({Key? key}) : super(key: key);

  @override
  State<CurrentUserProfileScreen> createState() =>
      _CurrentUserProfileScreenState();
}

class _CurrentUserProfileScreenState extends State<CurrentUserProfileScreen> {
  late UserProfileProvider _userProfileProvider;
  late AuthProvider _authProvider;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (_authProvider.currentUserId != null)
        _userProfileProvider.getUser(
          _authProvider.currentUserId!,
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    _authProvider = Provider.of<AuthProvider>(context);
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
