import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/auth/providers/auth.provider.dart';
import 'package:project/modules/auth/screens/register.screen.dart';
import 'package:project/modules/shared/utils/validators.utils.dart';
import 'package:project/modules/shared/widgets/app_logo.widget.dart';
import 'package:project/modules/shared/widgets/labeled_divider.widget.dart';
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
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 128,
              width: 128,
              child: AppLogo(),
            ),
            SizedBox(height: ThemeConfig.of(context)!.mediumSpacing),
            Text(
              S.of(context).LoginScreen_title,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: ThemeConfig.of(context)!.largeSpacing),
            TextFormField(
              controller: emailController,
              validator: (value) => UtilValidators.guard(value)
                  .required(S.of(context).LoginScreen_validator_email_required)
                  .message,
              decoration: InputDecoration(
                label: Text(S.of(context).LoginScreen_email_input_label),
                prefixIcon: Icon(Icons.alternate_email),
              ),
            ),
            SizedBox(height: ThemeConfig.of(context)!.mediumSpacing),
            TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: passwordController,
              validator: (value) => UtilValidators.guard(value)
                  .required(
                      S.of(context).LoginScreen_validator_password_required)
                  .message,
              decoration: InputDecoration(
                label: Text(S.of(context).LoginScreen_password_input_label),
                prefixIcon: Icon(Icons.password),
              ),
            ),
            SizedBox(height: ThemeConfig.of(context)!.largestSpacing),
            SizedBox(
              child: ElevatedButton(
                onPressed: () => _login(authProvider),
                child: Text(S.of(context).LoginScreen_login_button),
              ),
            ),
            SizedBox(height: ThemeConfig.of(context)!.largeSpacing),
            LabeledDivider(
              label: Text(S.of(context).LoginScreen_or),
            ),
            SizedBox(height: ThemeConfig.of(context)!.largeSpacing),
            OutlinedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, RegisterScreen.route),
              child: Text(S.of(context).LoginScreen_register_button),
            ),
            SizedBox(height: ThemeConfig.of(context)!.mediumSpacing),
            ElevatedButton(
              onPressed: null,
              child: Text(S.of(context).LoginScreen_google_button),
            ),
            SizedBox(height: ThemeConfig.of(context)!.mediumSpacing),
            ElevatedButton(
              onPressed: null,
              child: Text(S.of(context).LoginScreen_facebook_button),
            ),
          ],
        ),
      ),
    );
  }

  void _login(AuthProvider authProvider) {
    if (_formKey.currentState?.validate() ?? false) {
      authProvider
          .login(emailController.value.text, passwordController.value.text)
          .whenComplete(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: authProvider.error == null
                ? ThemeConfig.of(context)!.successColor
                : ThemeConfig.of(context)!.errorColor,
            content: Text(
              authProvider.error?.message ?? S.of(context).LoginScreen_success,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: authProvider.error == null
                    ? ThemeConfig.of(context)!.onSuccessColor
                    : ThemeConfig.of(context)!.onErrorColor,
              ),
            ),
            duration: Duration(seconds: 4),
          ),
        );
      });
    }
  }
}
