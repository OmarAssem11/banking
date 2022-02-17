import 'package:banking/layouts/home_layout.dart';
import 'package:banking/models/user.dart';
import 'package:banking/screens/home_screen.dart';
import 'package:banking/screens/profile_screen.dart';
import 'package:banking/screens/settings_screen.dart';
import 'package:banking/screens/stats_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GlobalProvider with ChangeNotifier {
  bool isDark = true;

  void switchTheme() {
    isDark = !isDark;
    notifyListeners();
  }

  ThemeMode getTheme() {
    if (isDark == true) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  bool isObscure = true;
  int day = 0;
  int month = 0;
  int year = 0;

  void changeObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  void createUser({
    required String uId,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String dateOfBirth,
  }) {
    final user = UserModel(
      uId: uId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      phone: phone,
      dateOfBirth: dateOfBirth,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(user.toMap())
        .then((_) {})
        .catchError((error) {
      final start = error.toString().indexOf(']') + 2;
      // ignore: invalid_return_type_for_catch_error
      return Fluttertoast.showToast(
        msg: error.toString().substring(start),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
      );
    });
  }

  void registerUser({
    required BuildContext context,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String dateOfBirth,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      createUser(
        uId: value.user!.uid,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phone: phone,
        dateOfBirth: dateOfBirth,
      );
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).pushReplacementNamed(HomeLayout.routeName);
    }).catchError((error) {
      final start = error.toString().indexOf(']') + 2;
      // ignore: invalid_return_type_for_catch_error
      return Fluttertoast.showToast(
        msg: error.toString().substring(start),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
      );
    });
  }

  void dayOnChange(dynamic value) {
    if (value is int) {
      day = value + 1;
      notifyListeners();
    }
  }

  void monthOnChange(dynamic value) {
    if (value is int) {
      month = value + 1;
      notifyListeners();
    }
  }

  void yearOnChange(dynamic value) {
    if (value is int) {
      year = value + 1923;
      notifyListeners();
    }
  }

  List<Widget> screens = const [
    HomeScreen(),
    StatsScreen(),
    WalletScreen(),
    SettingsScreen(),
  ];

  List<String> screensTitles = const [
    'Home',
    'Stats',
    'Wallet',
    'Settings',
  ];

  int selectedScreenIndex = 0;

  void bottomNavbarOnTap(int index) {
    selectedScreenIndex = index;
    notifyListeners();
  }
}
