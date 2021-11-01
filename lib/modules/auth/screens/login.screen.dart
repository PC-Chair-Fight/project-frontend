import 'package:flutter/material.dart';
import 'package:project/modules/auth/widgets/login_hello_world.widget.dart';
import 'package:project/modules/widgets/login.widget.dart';

class LoginScreen extends StatelessWidget {
  static const String route = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Login(),
      ),
    );
  }
}
