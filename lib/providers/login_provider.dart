// ignore_for_file: use_build_context_synchronously

import 'package:banking/layouts/home_layout.dart';
import 'package:banking/models/card_model.dart';
import 'package:banking/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class LoginProvider with ChangeNotifier {
  late String _uId;
  late UserModel userModel;
  CardModel? cardModel;

  final _instance = FirebaseFirestore.instance;

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) async {
      if (value.user != null) {
        _uId = value.user!.uid;
        await getUserModel();
        await getCardModel();
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.of(context).pushReplacementNamed(HomeLayout.routeName);
      }
    }).catchError((error) {
      error as FirebaseAuthException;
      final e = error.code.replaceAll('-', ' ');
      Fluttertoast.showToast(
        msg: toBeginningOfSentenceCase(e)!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
      );
    });
  }

  Future<void> getUserModel() async {
    final snapshot = await _instance.collection('users').doc(_uId).get();
    userModel = UserModel.fromJson(snapshot.data()!);
  }

  Future<void> getCardModel() async {
    final snapshot = await _instance
        .collection('users')
        .doc(_uId)
        .collection('card')
        .doc(_uId)
        .get();
    final data = snapshot.data();
    if (data != null) {
      cardModel = CardModel.fromJson(data);
    }
  }
}
