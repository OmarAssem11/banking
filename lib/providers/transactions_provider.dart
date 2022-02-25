import 'package:banking/models/card_model.dart';
import 'package:banking/models/transaction_model.dart';
import 'package:banking/models/user_model.dart';
import 'package:banking/providers/card_provider.dart';
import 'package:banking/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionsProvider with ChangeNotifier {
  final List<TransactionModel> transactions = [];
  final List<UserModel> transactionsUsers = [];

  final _instance = FirebaseFirestore.instance;

  void createTransaction({
    required BuildContext context,
    required double amount,
    required String receiverUId,
  }) {
    final transaction = TransactionModel(
      amount: amount,
      senderUId: uId,
      receiverUId: receiverUId,
      dateTime: Timestamp.now(),
    );
    _instance
        .collection('users')
        .doc(uId)
        .collection('transactions')
        .doc()
        .set(transaction.toMap())
        .then((_) {})
        .catchError((_) {});
    _instance
        .collection('users')
        .doc(receiverUId)
        .collection('transactions')
        .doc()
        .set(transaction.toMap())
        .then((_) {})
        .catchError((_) {});
    Provider.of<CardProvider>(
      context,
      listen: false,
    ).cardModel!.balance -= amount;
    CardModel? card;
    _instance
        .collection('users')
        .doc(receiverUId)
        .collection('card')
        .doc(receiverUId)
        .get()
        .then((value) => card = CardModel.fromJson(value.data()!))
        .catchError((_) {});
    card!.balance += amount;
    _instance
        .collection('users')
        .doc(receiverUId)
        .collection('card')
        .doc(receiverUId)
        .set(card!.toMap());
  }

  Future<void> getTransactionsModels() async {
    final snapshot = await _instance
        .collection('users')
        .doc(uId)
        .collection('transactions')
        .get();
    transactions.addAll(
      snapshot.docs.map((e) => TransactionModel.fromJson(e.data())).toList(),
    );
  }

  Future<UserModel> _getUserById(String uID) async {
    final snapshot = await _instance.collection('users').doc(uID).get();
    return UserModel.fromJson(snapshot.data()!);
  }

  Future<void> getTransactionsUsers() async {
    UserModel user;
    for (int i = 0; i < transactions.length; i++) {
      user = await _getUserById(transactions[i].receiverUId);
      transactionsUsers.add(user);
    }
  }

  Future<String?> getUIdByCardNumber(String cardNumber) async {
    String? id;
    final snapShot = await _instance.collection('users').get();
    final docs = snapShot.docs;
    for (int i = 0; i < docs.length; i++) {
      final cardSnapShot = await _instance
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
}
