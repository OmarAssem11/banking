import 'dart:io';
import 'package:banking/models/card_model.dart';
import 'package:banking/models/transaction_model.dart';
import 'package:banking/models/user_model.dart';
import 'package:banking/shared/constants.dart';
import 'package:banking/shared/error_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

mixin FirebaseServices {
  static final _firestore = FirebaseFirestore.instance;
  static final _auth = FirebaseAuth.instance;
  static final _storage = firebase_storage.FirebaseStorage.instance;

  static Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        uId = userCredential.user!.uid;
      }
    } on FirebaseAuthException catch (error) {
      ErrorHandler.registerError(error);
    }
  }

  static void storeUserData(UserModel userModel) => _firestore
      .collection('users')
      .doc(uId)
      .set(userModel.toMap())
      .then((_) {})
      .catchError((_) {});

  static Future<UserModel> getUserModel() async {
    final snapshot = await _firestore.collection('users').doc(uId).get();
    return UserModel.fromJson(snapshot.data()!);
  }

  static Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        uId = userCredential.user!.uid;
      }
    } on FirebaseAuthException catch (error) {
      ErrorHandler.loginError(error);
    }
  }

  static void storeCardData({
    required CardModel cardModel,
    required String uId,
  }) =>
      _firestore
          .collection('users')
          .doc(uId)
          .collection('card')
          .doc(uId)
          .set(cardModel.toMap())
          .then((_) {})
          .catchError((_) {});

  static Future<CardModel?> getCardModel(String uId) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(uId)
        .collection('card')
        .doc(uId)
        .get();
    final data = snapshot.data();
    if (data != null) {
      return CardModel.fromJson(data);
    }
    return null;
  }

  static Future<String?> uploadImage(File image) async {
    final taskSnapShot = await _storage
        .ref()
        .child('users/${Uri.file(image.path).pathSegments.last}')
        .putFile(image);
    return taskSnapShot.ref.getDownloadURL();
  }

  static void storeUpdatedUser({
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
    storeUserData(updatedModel);
  }

  static Future<String?> getUIdByCardNumber(String cardNumber) async {
    String? id;
    final snapShot = await _firestore.collection('users').get();
    final docs = snapShot.docs;
    for (int i = 0; i < docs.length; i++) {
      final cardSnapShot = await _firestore
          .collection('users')
          .doc(docs[i].id)
          .collection('card')
          .doc(docs[i].id)
          .get();
      if (CardModel.fromJson(cardSnapShot.data()!).cardNumber == cardNumber) {
        id = docs[i].id;
      }
    }
    return id;
  }

  static Future<UserModel> getUserById(String uID) async {
    final snapshot = await _firestore.collection('users').doc(uID).get();
    return UserModel.fromJson(snapshot.data()!);
  }

  static void storeTransactionData({
    required String uId,
    required TransactionModel transaction,
  }) {
    _firestore
        .collection('users')
        .doc(uId)
        .collection('transactions')
        .doc()
        .set(transaction.toMap())
        .then((_) {})
        .catchError((_) {});
  }

  static Future<void> getTransactionsModels(
    List<TransactionModel> transactions,
  ) async {
    final querySnapShot = await _firestore
        .collection('users')
        .doc(uId)
        .collection('transactions')
        .get();
    transactions.addAll(
      querySnapShot.docs
          .map((e) => TransactionModel.fromJson(e.data()))
          .toList(),
    );
  }
}
