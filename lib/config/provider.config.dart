import 'package:flutter/material.dart';
import 'package:project/modules/auth/providers/auth.provider.dart';
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
        ChangeNotifierProvider(create: (context) => AuthProvider(context)),
      ],
      child: child,
    );
  }
}
