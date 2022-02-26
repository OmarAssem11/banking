import 'package:banking/layouts/home_layout.dart';
import 'package:banking/providers/card_provider.dart';
import 'package:banking/providers/transactions_provider.dart';
import 'package:banking/providers/user_provider.dart';
import 'package:banking/screens/register_screen.dart';
import 'package:banking/shared/components/custom_button.dart';
import 'package:banking/shared/components/custom_text_form_field.dart';
import 'package:banking/shared/components/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<UserProvider>(context);
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
                'Login now to manage your accounts, transfer money and more',
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    loginProvider
                        .login(
                      email: emailController.text,
                      password: passwordController.text,
                    )
                        .then((value) {
                      if (loginProvider.userModel != null) {}
                    });
                    Provider.of<CardProvider>(
                      context,
                      listen: false,
                    ).getCardModel().then(
                          (_) => Provider.of<TransactionsProvider>(
                            context,
                            listen: false,
                          ).getTransactions().then(
                            (_) {
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                              Navigator.of(context)
                                  .pushReplacementNamed(HomeLayout.routeName);
                            },
                          ),
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
