// ignore_for_file: use_build_context_synchronously

import 'package:banking/components/components.dart';
import 'package:banking/layouts/home_layout.dart';
import 'package:banking/provider/global_provider.dart';
import 'package:banking/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GlobalProvider>(context);
    final themeColor = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: themeColor.onPrimary,
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
              customTextFormField(
                context: context,
                controller: emailController,
                text: 'Email address',
                prefix: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              passwordTextFormField(
                context: context,
                controller: passwordController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: customButtonStyle(context: context),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    UserCredential? token;
                    try {
                      token = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        Fluttertoast.showToast(
                          msg: 'User not found',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                        );
                      } else if (e.code == 'wrong-password') {
                        Fluttertoast.showToast(
                          msg: 'Wrong password',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                        );
                      }
                    }
                    if (token != null) {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context)
                          .pushReplacementNamed(HomeLayout.routeName);
                    }
                  }
                },
                child: const Text(
                  'LOGIN',
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
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          provider.isDark ? themeColor.secondary : Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushNamed(RegisterScreen.routeName),
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: !provider.isDark
                            ? themeColor.onBackground
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
