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
  }) {
    final loginProvider = Provider.of<LoginProvider>(
      context,
      listen: false,
    );
    final uId = loginProvider.userModel.uId;
    final card = CardModel(
      cardHolderName: cardHolderName,
      cardNumber: cardNumber,
      cvvCode: cvvCode,
      expiryDate: expiryDate,
      pinCode: '',
      balance: 0.0,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('card')
        .doc(uId)
        .set(card.toMap())
        .then((_) {})
        .catchError((_) {});
    loginProvider.cardModel = card;
  }
}
