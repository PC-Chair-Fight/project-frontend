import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/auth/providers/auth.provider.dart';
import 'package:project/modules/shared/utils/validators.utils.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  var _selectedDate = DateTime.now();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    dateOfBirthController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthProvider _authProvider = Provider.of<AuthProvider>(context);

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(ThemeConfig.of(context)!.appMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: usernameController,
              validator: (value) => UtilValidators.guard(value)
                  .required(S.of(context).RegisterScreen_username_required)
                  .message,
              decoration: InputDecoration(
                label: Text(S.of(context).RegisterScreen_username_input_label),
                prefixIcon: Icon(Icons.account_circle_outlined),
              ),
            ),
            SizedBox(height: ThemeConfig.of(context)!.mediumSpacing),
            TextFormField(
              textInputAction: TextInputAction.next,
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
              readOnly: true,
              onTap: () => _selectDate(context),
              controller: dateOfBirthController,
              validator: (value) => UtilValidators.guard(value)
                  .required(S.of(context).RegisterScreen_date_of_birth_required)
                  .message,
              decoration: InputDecoration(
                label: Text(
                    S.of(context).RegisterScreen_date_of_birth_input_label),
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ),
            SizedBox(height: ThemeConfig.of(context)!.mediumSpacing),
            TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              controller: passwordController,
              validator: (value) => UtilValidators.guard(value)
                  .required(S.of(context).RegisterScreen_password_required)
                  .atLeast(3, S.of(context).RegisterScreen_password_too_short)
                  .contains(
                      " !\"#\$%&'()*+,-./:;<=>?@[]^_`{|}~",
                      1,
                      S
                          .of(context)
                          .RegisterScreen_password_no_special_characters)
                  .message,
              decoration: InputDecoration(
                label: Text('Password'),
                prefixIcon: Icon(Icons.password),
              ),
            ),
            SizedBox(height: ThemeConfig.of(context)!.mediumSpacing),
            TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              textInputAction: TextInputAction.done,
              controller: confirmPasswordController,
              validator: (value) => UtilValidators.guard(value)
                  .required(
                      S.of(context).RegisterScreen_confirm_password_required)
                  .equal(
                      passwordController.value.text,
                      S
                          .of(context)
                          .RegisterScreen_confirm_password_does_not_match)
                  .message,
              decoration: InputDecoration(
                label: Text(
                    S.of(context).RegisterScreen_confirm_password_input_label),
                prefixIcon: Icon(Icons.password),
              ),
            ),
            SizedBox(height: ThemeConfig.of(context)!.largestSpacing),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) _register(_authProvider);
              },
              child: Text(S.of(context).RegisterScreen_register_button),
            ),
            SizedBox(height: ThemeConfig.of(context)!.mediumSpacing),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(S.of(context).RegisterScreen_back_to_login_button),
            )
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(now.year - 100, now.month, now.day),
        lastDate: now);
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
        dateOfBirthController.text =
            DateFormat(DateFormat.YEAR_NUM_MONTH_DAY).format(picked);
      });
  }

  _register(AuthProvider authProvider) {
    authProvider
        .register(usernameController.value.text, emailController.value.text,
            _selectedDate, passwordController.value.text)
        .whenComplete(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: authProvider.error == null
              ? ThemeConfig.of(context)!.successColor
              : ThemeConfig.of(context)!.errorColor,
          content: Text(
            authProvider.error?.toString() ??
                S.of(context).RegisterScreen_success,
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
      if (authProvider.error == null) Navigator.of(context).pop();
    });
  }
}
