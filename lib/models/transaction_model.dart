import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  late double amount;
  late String senderUId;
  late String receiverUId;
  late Timestamp dateTime;

  TransactionModel({
    required this.amount,
    required this.senderUId,
    required this.receiverUId,
    required this.dateTime,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'] as double;
    senderUId = json['senderUId'] as String;
    receiverUId = json['receiverUId'] as String;
    dateTime = json['dateTime'] as Timestamp;
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'senderUId': senderUId,
      'receiverUId': receiverUId,
      'dateTime': dateTime,
    };
  }
}
