import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/modules/auth/providers/auth.provider.dart';
import 'package:project/modules/auth/screens/register.screen.dart';
import 'package:project/modules/shared/utils/validators.utils.dart';
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
      _authProvider
          .login(emailController.value.text, passwordController.value.text)
          .whenComplete(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: _authProvider.error == null
                ? ThemeConfig.of(context)!.successColor
                : ThemeConfig.of(context)!.errorColor,
            content: Text(
              _authProvider.error?.toString() ?? 'Authentication successful',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _authProvider.error == null
                    ? ThemeConfig.of(context)!.onSuccessColor
                    : ThemeConfig.of(context)!.onErrorColor,
              ),
            ),
            duration: Duration(seconds: 4),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome',
              style: TextStyle(fontSize: ThemeConfig.of(context)!.headline1),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: ThemeConfig.of(context)!.largestSpacing),
            TextFormField(
                controller: emailController,
                // The validator receives the text that the user has entered.
                validator: (value) => UtilValidators.guard(value)
                    .required('Please enter your email')
                    .message,
                decoration: InputDecoration(
                    label: Text('Email'),
                    prefixIcon: Icon(Icons.alternate_email))),
            SizedBox(height: ThemeConfig.of(context)!.largeSpacing),
            TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: passwordController,
              // The validator receives the text that the user has entered.
              validator: (value) => UtilValidators.guard(value)
                  .required('Please enter your password')
                  .message,
              decoration: InputDecoration(
                  label: Text('Password'), prefixIcon: Icon(Icons.password)),
            ),
            SizedBox(height: ThemeConfig.of(context)!.largestSpacing),
            SizedBox(
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
            SizedBox(height: ThemeConfig.of(context)!.largeSpacing),
            SizedBox(
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
            SizedBox(height: ThemeConfig.of(context)!.largeSpacing),
            SizedBox(
              child: ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RegisterScreen.route),
                child: const Text('Register'),
              ),
            ),
            SizedBox(height: ThemeConfig.of(context)!.mediumSpacing),
            SizedBox(
              child: ElevatedButton(
                onPressed: null,
                child: const Text('Continue with Google'),
              ),
            ),
            SizedBox(height: ThemeConfig.of(context)!.mediumSpacing),
            SizedBox(
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
