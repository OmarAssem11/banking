import 'package:banking/models/card_model.dart';
import 'package:banking/providers/login_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardProvider with ChangeNotifier {
  void createCard({
    required BuildContext context,
    required String cardHolderName,
    required String cardNumber,
    required String cvvCode,
    required String expiryDate,
    required String pinCode,
    required double balance,
  }) {
    final uId =
        Provider.of<LoginProvider>(context, listen: false).userModel.uId;
    final card = CardModel(
      cardHolderName: cardHolderName,
      cardNumber: cardNumber,
      cvvCode: cvvCode,
      expiryDate: expiryDate,
      pinCode: pinCode,
      balance: balance,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('card')
        .doc(uId)
        .set(card.toMap())
        .then((_) {})
        .catchError((_) {});
  }
}
