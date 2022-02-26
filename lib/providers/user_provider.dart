import 'dart:io';
import 'package:banking/models/user_model.dart';
import 'package:banking/shared/constants.dart';
import 'package:banking/shared/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProvider with ChangeNotifier {
  UserModel? userModel;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await FirebaseServices.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (uId != null) {
      userModel = await FirebaseServices.getUserModel();
    }
  }

  Future<File?> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  void changeProfileImage() {
    _getImage().then((value) {
      if (value != null) {
        FirebaseServices.uploadImage(value).then((value) {
          FirebaseServices.storeUpdatedUser(
            oldModel: userModel!,
            imageUrl: value,
          );
          userModel!.imageUrl = value!;
          notifyListeners();
        });
      }
    }).catchError((_) {});
  }

  void changeName(String newName) {
    userModel!.name = newName;
    notifyListeners();
    FirebaseServices.storeUpdatedUser(
      oldModel: userModel!,
      name: newName,
    );
  }

  void changeEmail(String newEmail) {
    userModel!.email = newEmail;
    notifyListeners();
    FirebaseServices.storeUpdatedUser(
      oldModel: userModel!,
      email: newEmail,
    );
  }

  void changePassword(String newPassword) {
    userModel!.password = newPassword;
    notifyListeners();
    FirebaseServices.storeUpdatedUser(
      oldModel: userModel!,
      password: newPassword,
    );
  }

  void changePhone(String newPhone) {
    userModel!.phone = newPhone;
    notifyListeners();
    FirebaseServices.storeUpdatedUser(
      oldModel: userModel!,
      phone: newPhone,
    );
  }
}
