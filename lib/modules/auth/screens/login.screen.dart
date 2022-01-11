import 'package:flutter/material.dart';
import 'package:project/modules/auth/widgets/login.widget.dart';

class LoginScreen extends StatelessWidget {
  static const String route = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Login(),
        ),
      ),
    );
  }
}
