import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                textInputAction: TextInputAction.next,
                controller: usernameController,
                validator: (value) => UtilValidators.guard(value)
                    .required('Please enter an username')
                    .message,
                decoration: InputDecoration(
                    label: Text('Username'),
                    prefixIcon: Icon(Icons.account_circle_outlined))),
            SizedBox(
              height: ThemeConfig.of(context)!.largeSpacing,
            ),
            TextFormField(
                textInputAction: TextInputAction.next,
                controller: emailController,
                validator: (value) => UtilValidators.guard(value)
                    .required('Please enter your email address')
                    .message,
                decoration: InputDecoration(
                    label: Text('Email'),
                    prefixIcon: Icon(Icons.alternate_email))),
            SizedBox(
              height: ThemeConfig.of(context)!.largeSpacing,
            ),
            TextFormField(
              readOnly: true,
              onTap: () => _selectDate(context),
              controller: dateOfBirthController,
              decoration: InputDecoration(
                label: Text('Date of birth'),
                prefixIcon: Icon(Icons.calendar_today),
              ),
              validator: (value) => UtilValidators.guard(value)
                  .required('Please enter your date of birth')
                  .message,
            ),
            SizedBox(
              height: ThemeConfig.of(context)!.largeSpacing,
            ),
            TextFormField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                controller: passwordController,
                validator: (value) =>
                    // UtilValidators.required(value, 'Enter a valid password'),
                    UtilValidators.guard(value)
                        .required('Please enter a password')
                        .atLeast(
                            3, 'Password should be at least 3 characters long')
                        .contains(" !\"#\$%&'()*+,-./:;<=>?@[]^_`{|}~", 1,
                            'Password should contain at least 1 special character')
                        .message,
                decoration: InputDecoration(
                    label: Text('Password'), prefixIcon: Icon(Icons.password))),
            SizedBox(
              height: ThemeConfig.of(context)!.largeSpacing,
            ),
            TextFormField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                controller: confirmPasswordController,
                validator: (value) => UtilValidators.guard(value)
                    .required('Please confirm your password')
                    .equal(
                        passwordController.value.text, 'Passwords do not match')
                    .message,
                decoration: InputDecoration(
                    label: Text('Confirm Password'),
                    prefixIcon: Icon(Icons.password))),
            SizedBox(height: ThemeConfig.of(context)!.largestSpacing),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate())
                    register(_authProvider);
                },
                child: const Text('Register'),
              ),
            ),
            SizedBox(
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Back To Login'),
              ),
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

        // TODO use format from intl when available
        dateOfBirthController.text =
            '${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}';
      });
  }

  register(AuthProvider authProvider) {
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
            authProvider.error?.toString() ?? 'Account created',
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
