import 'package:banking/models/card_model.dart';
import 'package:flutter/material.dart';

class TransactionsProvider with ChangeNotifier {
  late double balance;

  bool deposit(double amount) {
    balance += amount;
    return true;
  }

  bool withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
      return true;
    } else {
      return false;
    }
  }

  bool transferTo(double amount, CardModel recipient) {
    if (balance >= amount) {
      balance -= amount;
      recipient.balance += amount;
      return true;
    } else {
      return false;
    }
  }
}
