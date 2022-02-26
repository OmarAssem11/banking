import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

mixin FirebaseErrorHandler {
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
}
