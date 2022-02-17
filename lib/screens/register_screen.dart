import 'package:banking/components/components.dart';
import 'package:banking/components/constants.dart';
import 'package:banking/provider/global_provider.dart';
import 'package:banking/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const routeName = '/register';
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GlobalProvider>(context);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
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
              Row(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      constraints: const BoxConstraints(maxWidth: 155),
                      labelText: 'First name',
                      labelStyle: TextStyle(color: theme.colorScheme.secondary),
                      hintStyle: TextStyle(color: theme.colorScheme.secondary),
                      hintText: 'First name',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    controller: firstNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(width: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      constraints: const BoxConstraints(maxWidth: 155),
                      labelText: 'Last name',
                      labelStyle: TextStyle(color: theme.colorScheme.secondary),
                      hintStyle: TextStyle(color: theme.colorScheme.secondary),
                      hintText: 'Last name',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    controller: lastNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name can't be empty";
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              customTextFormField(
                context: context,
                controller: phoneController,
                text: 'Phone number',
                prefix: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  customDropDownButton(
                    context: context,
                    list: months,
                    hint: 'Month',
                    amount: 1,
                    onChange: provider.monthOnChange,
                  ),
                  const SizedBox(width: 10),
                  if (provider.month == 1 ||
                      provider.month == 3 ||
                      provider.month == 5 ||
                      provider.month == 7 ||
                      provider.month == 8 ||
                      provider.month == 10 ||
                      provider.month == 12)
                    customDropDownButton(
                      context: context,
                      list: days31,
                      hint: 'Day',
                      amount: 1,
                      onChange: provider.dayOnChange,
                    ),
                  if (provider.month == 4 ||
                      provider.month == 6 ||
                      provider.month == 9 ||
                      provider.month == 11)
                    customDropDownButton(
                      context: context,
                      list: days30,
                      hint: 'Day',
                      amount: 1,
                      onChange: provider.dayOnChange,
                    ),
                  if (provider.month == 2)
                    customDropDownButton(
                      context: context,
                      list: days29,
                      hint: 'Day',
                      amount: 1,
                      onChange: provider.dayOnChange,
                    ),
                  if (provider.month == 0)
                    customDropDownButton(
                      context: context,
                      list: days31,
                      hint: 'Day',
                      amount: 1,
                    ),
                  const SizedBox(width: 10),
                  customDropDownButton(
                    context: context,
                    list: years.reversed,
                    hint: 'Year',
                    amount: 1923,
                    onChange: provider.yearOnChange,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: customButtonStyle(context: context),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    try {
                      provider.registerUser(
                        context: context,
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        phone: phoneController.text,
                        dateOfBirth:
                            '${provider.day}/${provider.month}/${provider.year}',
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        Fluttertoast.showToast(
                          msg: 'Weak password',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                        );
                      } else if (e.code == 'email-already-in-use') {
                        Fluttertoast.showToast(
                          msg: 'Email already in use',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                        );
                      } else if (e.code == 'invalid-email') {
                        Fluttertoast.showToast(
                          msg: 'Invalid email',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                        );
                      }
                    }
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
                      color: provider.isDark
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
                        color: !provider.isDark
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
