import 'package:banking/models/transaction_model.dart';
import 'package:banking/models/user_model.dart';
import 'package:banking/providers/card_provider.dart';
import 'package:banking/shared/constants.dart';
import 'package:banking/shared/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionsProvider with ChangeNotifier {
  List<TransactionModel> transactions = [];
  List<UserModel> transactionsUsers = [];

  TransactionModel _createTransactionModel({
    required double amount,
    required String receiverUId,
  }) =>
      TransactionModel(
        amount: amount,
        senderUId: uId!,
        receiverUId: receiverUId,
        dateTime: Timestamp.now(),
      );

  void _storeTransactionData({
    required double amount,
    required String receiverUId,
  }) {
    final transaction = _createTransactionModel(
      amount: amount,
      receiverUId: receiverUId,
    );
    transactions.add(transaction);
    FirebaseServices.getUserById(receiverUId)
        .then((value) => transactionsUsers.add(value));
    FirebaseServices.storeTransactionData(
      uId: transaction.senderUId,
      transaction: transaction,
    );
    FirebaseServices.storeTransactionData(
      uId: transaction.receiverUId,
      transaction: transaction,
    );
  }

  void _updateCardsAfterTransaction({
    required BuildContext context,
    required double amount,
    required String receiverUId,
  }) {
    final myCard = Provider.of<CardProvider>(
      context,
      listen: false,
    ).cardModel!;
    myCard.balance -= amount;
    FirebaseServices.storeCardData(
      cardModel: myCard,
      uId: uId!,
    );
    FirebaseServices.getCardModel(receiverUId).then((value) {
      value!.balance += amount;
      FirebaseServices.storeCardData(
        cardModel: value,
        uId: receiverUId,
      );
    });
  }

  void createTransaction({
    required BuildContext context,
    required double amount,
    required String receiverUId,
  }) {
    _storeTransactionData(
      amount: amount,
      receiverUId: receiverUId,
    );
    _updateCardsAfterTransaction(
      context: context,
      amount: amount,
      receiverUId: receiverUId,
    );
    notifyListeners();
    Provider.of<CardProvider>(
      context,
      listen: false,
    ).updateCardModel();
  }

  Future<void> _getTransactionsModels() async {
    await FirebaseServices.getTransactionsModels(transactions);
    transactions.sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  Future<void> _getTransactionsUsers() async {
    UserModel user;
    for (int i = 0; i < transactions.length; i++) {
      transactions[i].senderUId == uId
          ? user =
              await FirebaseServices.getUserById(transactions[i].receiverUId)
          : user =
              await FirebaseServices.getUserById(transactions[i].senderUId);
      transactionsUsers.add(user);
    }
  }

  Future<void> getTransactions() async {
    await _getTransactionsModels();
    await _getTransactionsUsers();
  }

  Future<String?> getUIdByCardNumber(String cardNumber) =>
      FirebaseServices.getUIdByCardNumber(cardNumber);
}
