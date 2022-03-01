import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

mixin ErrorHandler {
  static void registerError(FirebaseAuthException error) {
    final start = error.toString().indexOf(']') + 2;
    Fluttertoast.showToast(
      msg: error.toString().substring(start),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
    );
  }

  static void loginError(FirebaseAuthException error) {
    final e = error.code.replaceAll('-', ' ');
    Fluttertoast.showToast(
      msg: toBeginningOfSentenceCase(e)!,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
    );
  }

  static void invalidInput({
    required BuildContext context,
    required String errorMessage,
  }) {
    final snackBar = SnackBar(
      backgroundColor: const Color.fromARGB(255, 192, 0, 0),
      content: Row(
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: Colors.white,
            size: 22,
          ),
          const SizedBox(width: 8),
          Text(errorMessage),
        ],
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
