import 'package:banking/models/user_model.dart';
import 'package:banking/shared/constants.dart';
import 'package:banking/shared/firebase_services.dart';
import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  UserModel _createUserModel({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) =>
      UserModel(
        uId: uId!,
        name: name,
        email: email,
        password: password,
        phone: phone,
        imageUrl:
            'https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?t=st=1645405464~exp=1645406064~hmac=f0be9c518f77fde6b31f62d39d5c2739117e192b8c0768d7e1377cbb3623b10c&w=740',
      );

  Future<UserModel?> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    await FirebaseServices.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (uId != null) {
      final userModel = _createUserModel(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );
      FirebaseServices.storeUserData(userModel);
      return userModel;
    }
    return null;
  }
}
