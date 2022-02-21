import 'package:banking/components/custom_button_style.dart';
import 'package:banking/components/custom_text_form_field.dart';
import 'package:banking/components/password_text_form_field.dart';
import 'package:banking/providers/register_provider.dart';
import 'package:banking/screens/login_screen.dart';
import 'package:banking/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const routeName = '/register';
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
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
                'Some text about why you should register to the application',
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
              ElevatedButton(
                style: customButtonStyle(context: context),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    registerProvider.register(
                      context: context,
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      phone: phoneController.text,
                    );
                  }
                },
                child: const Text(
                  'REGISTER',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 16,
                      color: themeProvider.isDark
                          ? theme.colorScheme.secondary
                          : Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(LoginScreen.routeName),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 16,
                        color: !themeProvider.isDark
                            ? theme.colorScheme.onBackground
                            : const Color.fromARGB(255, 57, 12, 136),
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
