import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/modules/shared/widgets/loading_indicator.widget.dart';
import 'package:project/modules/user/providers/user_profile.provider.dart';
import 'package:project/modules/user/widgets/user_profile.widget.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  static const String route = '/user';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final userId = ModalRoute.of(context)?.settings.arguments as int?;
      if (userId == null) Navigator.pop(context);
      Provider.of<UserProfileProvider>(context, listen: false).getUser(
        userId!,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProfileProvider>(context);
    if (provider.error != null) {
      Navigator.pop(context); //TODO error screen
    }

    return Scaffold(
        body: provider.loading
            ? Center(
                child: LoadingIndicator(
                  type: LoadingIndicatorType.Page,
                ),
              )
            : UserProfile(activeUser: provider.activeUser!));
  }
}
