import 'package:banking/models/card_model.dart';
import 'package:banking/providers/login_provider.dart';
import 'package:banking/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardProvider with ChangeNotifier {
  CardModel? cardModel;

  final _instance = FirebaseFirestore.instance;

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
    _instance
        .collection('users')
        .doc(uId)
        .collection('card')
        .doc(uId)
        .set(card.toMap())
        .then((_) {})
        .catchError((_) {});
    cardModel = card;
  }

  Future<void> getCardModel() async {
    final snapshot = await _instance
        .collection('users')
        .doc(uId)
        .collection('card')
        .doc(uId)
        .get();
    final data = snapshot.data();
    if (data != null) {
      cardModel = CardModel.fromJson(data);
    }
  }
}
