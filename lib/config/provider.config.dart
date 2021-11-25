import 'package:flutter/material.dart';
import 'package:project/modules/auth/providers/auth.provider.dart';
import 'package:project/modules/job/providers/job_details.provider.dart';
import 'package:provider/provider.dart';

class ProviderConfig extends StatelessWidget {
  final Widget child;

  const ProviderConfig({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider(context)),
        ChangeNotifierProvider<JobDetailsProvider>(
            create: (context) => JobDetailsProvider(context)),
      ],
      child: child,
    );
  }
}
