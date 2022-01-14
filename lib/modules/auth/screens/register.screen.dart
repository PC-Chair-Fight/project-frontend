import 'package:flutter/material.dart';
import 'package:project/modules/auth/widgets/register.widget.dart';

class RegisterScreen extends StatelessWidget {
  static const String route = '/Register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Register(),
        ),
      ),
    );
  }
}
