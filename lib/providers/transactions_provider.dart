import 'package:banking/models/transaction_model.dart';
import 'package:banking/models/user_model.dart';
import 'package:banking/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TransactionsProvider with ChangeNotifier {
  final List<TransactionModel> transactions = [];
  final List<UserModel> transactionsUsers = [];

  final _instance = FirebaseFirestore.instance;

  void createTransaction({
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

// bool transferTo(double amount, CardModel recipient) {
//     if (balance >= amount) {
//       balance -= amount;
//       recipient.balance += amount;
//       return true;
//     } else {
//       return false;
//     }
//   }
}
