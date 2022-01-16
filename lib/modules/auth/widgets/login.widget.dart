import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/auth/providers/auth.provider.dart';
import 'package:project/modules/auth/screens/register.screen.dart';
import 'package:project/modules/main/screens/main_wrapper.screen.dart';
import 'package:project/modules/shared/utils/validators.utils.dart';
import 'package:project/modules/shared/widgets/app_logo.widget.dart';
import 'package:project/modules/shared/widgets/flushbar.widget.dart';
import 'package:project/modules/shared/widgets/labeled_divider.widget.dart';
import 'package:project/modules/shared/widgets/loading_indicator.widget.dart';
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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 64,
                    child: AppLogo(),
                  ),
                  SizedBox(height: ThemeConfig.of(context).largestSpacing),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: ThemeConfig.of(context).appMediumWidth,
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          validator: (value) => UtilValidators.guard(value)
                              .required(S
                                  .of(context)
                                  .LoginScreen_validator_email_required)
                              .message,
                          decoration: InputDecoration(
                            label: Text(
                                S.of(context).LoginScreen_email_input_label),
                          ),
                        ),
                        SizedBox(height: ThemeConfig.of(context).mediumSpacing),
                        TextFormField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: passwordController,
                          validator: (value) => UtilValidators.guard(value)
                              .required(S
                                  .of(context)
                                  .LoginScreen_validator_password_required)
                              .message,
                          decoration: InputDecoration(
                            label: Text(
                                S.of(context).LoginScreen_password_input_label),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ThemeConfig.of(context).largestSpacing),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: ThemeConfig.of(context).appSmallWidth,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: () => _login(authProvider),
                          child: authProvider.loading
                              ? LoadingIndicator(
                                  type: LoadingIndicatorType.Button)
                              : Text(S.of(context).LoginScreen_login_button),
                        ),
                        SizedBox(height: ThemeConfig.of(context).largeSpacing),
                        LabeledDivider(
                          label: Text(S.of(context).LoginScreen_or),
                        ),
                        SizedBox(height: ThemeConfig.of(context).largeSpacing),
                        ElevatedButton(
                          onPressed: () => Navigator.pushNamed(
                              context, RegisterScreen.route),
                          style: ThemeConfig.of(context)
                              .appElevatedButtonAltStyle(),
                          child:
                              Text(S.of(context).LoginScreen_register_button),
                        ),
                        SizedBox(height: ThemeConfig.of(context).mediumSpacing),
                        ElevatedButton(
                          onPressed: () {},
                          style: ThemeConfig.of(context)
                              .appElevatedButtonAltStyle(),
                          child: Text(S.of(context).LoginScreen_google_button),
                        ),
                        SizedBox(height: ThemeConfig.of(context).mediumSpacing),
                        ElevatedButton(
                          onPressed: () {},
                          style: ThemeConfig.of(context)
                              .appElevatedButtonAltStyle(),
                          child:
                              Text(S.of(context).LoginScreen_facebook_button),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login(AuthProvider authProvider) {
    if ((_formKey.currentState?.validate() ?? false) && !authProvider.loading) {
      authProvider
          .login(emailController.value.text, passwordController.value.text)
          .whenComplete(() {
        if (authProvider.authToken != null)
          Navigator.pushNamedAndRemoveUntil(context, MainWrapperScreen.route,
              (Route? route) => route == null);
        showAppFlushbar(context,
            message: authProvider.error?.message ??
                S.of(context).LoginScreen_success,
            messageType: authProvider.error == null
                ? MessageType.Information
                : MessageType.Error);
      });
    }
  }
}
