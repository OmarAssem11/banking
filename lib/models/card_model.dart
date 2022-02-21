class CardModel {
  late String cardHolderName;
  late String cardNumber;
  late String cvvCode;
  late String expiryDate;
  late String pinCode;
  late double balance;

  CardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.cvvCode,
    required this.expiryDate,
    required this.pinCode,
    required this.balance,
  });

  CardModel.fromJson(Map<String, dynamic> json) {
    cardHolderName = json['cardHolderName'] as String;
    cardNumber = json['cardNumber'] as String;
    cvvCode = json['cvvCode'] as String;
    expiryDate = json['expiryDate'] as String;
    pinCode = json['pinCode'] as String;
    balance = json['balance'] as double;
  }

  Map<String, dynamic> toMap() {
    return {
      'cardHolderName': cardHolderName,
      'cardNumber': cardNumber,
      'cvvCode': cvvCode,
      'expiryDate': expiryDate,
      'pinCode': pinCode,
      'balance': balance,
    };
  }
}
