// ignore_for_file: use_build_context_synchronously

import 'package:banking/layouts/home_layout.dart';
import 'package:banking/models/user_model.dart';
import 'package:banking/providers/card_provider.dart';
import 'package:banking/providers/transactions_provider.dart';
import 'package:banking/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class LoginProvider with ChangeNotifier {
  late UserModel userModel;

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final transactionsProvider = Provider.of<TransactionsProvider>(
      context,
      listen: false,
    );
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) async {
      if (value.user != null) {
        uId = value.user!.uid;
        await getUserModel();
        await Provider.of<CardProvider>(
          context,
          listen: false,
        ).getCardModel();
        await transactionsProvider.getTransactionsModels();
        await transactionsProvider.getTransactionsUsers();
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
    final snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uId).get();
    userModel = UserModel.fromJson(snapshot.data()!);
  }
}
