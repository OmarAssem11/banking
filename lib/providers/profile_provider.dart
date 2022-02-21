import 'dart:io';
import 'package:banking/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider with ChangeNotifier {
  void _updateUser({
    required UserModel oldModel,
    String? name,
    String? email,
    String? password,
    String? phone,
    String? imageUrl,
  }) {
    final updatedModel = UserModel(
      uId: oldModel.uId,
      name: name ?? oldModel.name,
      email: email ?? oldModel.email,
      password: password ?? oldModel.password,
      phone: phone ?? oldModel.phone,
      imageUrl: imageUrl ?? oldModel.imageUrl,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(oldModel.uId)
        .update(updatedModel.toMap())
        .then((_) {
      oldModel.name = updatedModel.name;
      oldModel.email = updatedModel.email;
      oldModel.password = updatedModel.password;
      oldModel.phone = updatedModel.phone;
      oldModel.imageUrl = updatedModel.imageUrl;
    }).catchError((_) {});
  }

  Future<File?> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  void _uploadImage({
    required UserModel oldModel,
    required File image,
  }) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(image.path).pathSegments.last}')
        .putFile(image)
        .then((value) {
      value.ref
          .getDownloadURL()
          .then(
            (value) => _updateUser(
              oldModel: oldModel,
              imageUrl: value,
            ),
          )
          .catchError((_) {});
    }).catchError((_) {});
  }

  void changeProfileImage({
    required UserModel oldModel,
  }) {
    _getImage().then((value) {
      if (value != null) {
        _uploadImage(oldModel: oldModel, image: value);
      }
    }).catchError((_) {});
  }
}
