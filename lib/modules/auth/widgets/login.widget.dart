import 'package:flutter/material.dart';
import 'package:project/modules/auth/providers/auth.provider.dart';
import 'package:provider/provider.dart';

// Define a custom Form widget.
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final AuthProvider _authProvider = Provider.of<AuthProvider>(context);

    void login() {
      _authProvider.login(emailController.value.text, passwordController.value.text).whenComplete(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_authProvider.error ?? 'Authentication successful'),
            duration: Duration(seconds: 1),
          ),
        );
      });
    }
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            TextFormField(
                controller: emailController,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                decoration: InputDecoration(label: Text('Email'), prefixIcon: Icon(Icons.alternate_email))),
            SizedBox(height: 16),
            TextFormField(
              controller: passwordController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              decoration: InputDecoration(label: Text('Password'), prefixIcon: Icon(Icons.password)),
            ),
            SizedBox(height: 64),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    login();
                  }
                },
                child: const Text('Login'),
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('OR'),
                    ),
                    Expanded(child: Divider())
                  ],
                )),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null,
                child: const Text('Register'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null,
                child: const Text('Continue with Google'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null,
                child: const Text('Continue with Facebook'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
