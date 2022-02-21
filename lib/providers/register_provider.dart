import 'package:banking/layouts/home_layout.dart';
import 'package:banking/models/user_model.dart';
import 'package:banking/providers/login_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class RegisterProvider with ChangeNotifier {
  void _createUser({
    required BuildContext context,
    required String uId,
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    final user = UserModel(
      uId: uId,
      name: name,
      email: email,
      password: password,
      phone: phone,
      imageUrl:
          'https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?t=st=1645405464~exp=1645406064~hmac=f0be9c518f77fde6b31f62d39d5c2739117e192b8c0768d7e1377cbb3623b10c&w=740',
    );
    Provider.of<LoginProvider>(
      context,
      listen: false,
    ).userModel = user;
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(user.toMap())
        .then((_) {})
        .catchError((error) {
      final start = error.toString().indexOf(']') + 2;
      Fluttertoast.showToast(
        msg: error.toString().substring(start),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
      );
    });
  }

  void register({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      _createUser(
        context: context,
        uId: value.user!.uid,
        name: name,
        email: email,
        password: password,
        phone: phone,
      );
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).pushReplacementNamed(HomeLayout.routeName);
    }).catchError((error) {
      final start = error.toString().indexOf(']') + 2;
      Fluttertoast.showToast(
        msg: error.toString().substring(start),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
      );
    });
  }
}
