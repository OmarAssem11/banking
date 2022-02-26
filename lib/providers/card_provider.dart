import 'package:banking/models/card_model.dart';
import 'package:banking/shared/constants.dart';
import 'package:banking/shared/firebase_services.dart';
import 'package:flutter/material.dart';

class CardProvider with ChangeNotifier {
  CardModel? cardModel;

  CardModel _createCardModel({
    required String cardHolderName,
    required String cardNumber,
    required String cvvCode,
    required String expiryDate,
    required String pinCode,
  }) =>
      CardModel(
        cardHolderName: cardHolderName,
        cardNumber: cardNumber,
        cvvCode: cvvCode,
        expiryDate: expiryDate,
        pinCode: pinCode,
        balance: 1000.0,
      );

  void createCard({
    required String cardHolderName,
    required String cardNumber,
    required String cvvCode,
    required String expiryDate,
    required String pinCode,
  }) {
    final model = _createCardModel(
      cardHolderName: cardHolderName,
      cardNumber: cardNumber,
      cvvCode: cvvCode,
      expiryDate: expiryDate,
      pinCode: pinCode,
    );
    FirebaseServices.storeCardData(
      cardModel: model,
      uId: uId!,
    );
    cardModel = model;
    notifyListeners();
  }

  Future<void> getCardModel() async =>
      cardModel = await FirebaseServices.getCardModel(uId!);

  void updateCardModel() => notifyListeners();
}
