import 'package:banking/components/custom_button.dart';
import 'package:banking/components/custom_text_form_field.dart';
import 'package:banking/components/password_text_form_field.dart';
import 'package:banking/providers/login_provider.dart';
import 'package:banking/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final themeColor = Theme.of(context).colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LOGIN',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 8),
              Text(
                'Some text about why you should login to the application',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: emailController,
                text: 'Email address',
                prefix: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordTextFormField(
                controller: passwordController,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'login',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await loginProvider.login(
                      context: context,
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 16,
                      color: themeColor.onTertiary,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(RegisterScreen.routeName),
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: themeColor.tertiaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
