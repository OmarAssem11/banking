import 'package:banking/layouts/home_layout.dart';
import 'package:banking/providers/register_provider.dart';
import 'package:banking/providers/user_provider.dart';
import 'package:banking/screens/login_screen.dart';
import 'package:banking/shared/components/custom_button.dart';
import 'package:banking/shared/components/custom_text_form_field.dart';
import 'package:banking/shared/components/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const routeName = '/register';
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(
      context,
      listen: false,
    );
    final theme = Theme.of(context);
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
                'REGISTER',
                style: theme.textTheme.headline4,
              ),
              const SizedBox(height: 8),
              Text(
                'Register now to manage your accounts, transfer money and more',
                style: theme.textTheme.subtitle1,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: nameController,
                text: 'Full name',
                prefix: Icons.account_circle_outlined,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: phoneController,
                text: 'Phone number',
                prefix: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'register',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    registerProvider
                        .register(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      phone: phoneController.text,
                    )
                        .then((value) {
                      if (value != null) {
                        Provider.of<UserProvider>(
                          context,
                          listen: false,
                        ).userModel = value;
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                        Navigator.of(context)
                            .pushReplacementNamed(HomeLayout.routeName);
                      }
                    });
                  }
                },
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.colorScheme.onTertiary,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.colorScheme.tertiaryContainer,
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
