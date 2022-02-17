import 'package:banking/models/user.dart';

class Client extends UserModel {
  double balance;

  Client({
    required String uId,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String dateOfBirth,
    required this.balance,
  }) : super(
          uId: uId,
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          phone: phone,
          dateOfBirth: dateOfBirth,
        );

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

  bool transferTo(double amount, Client recipient) {
    if (balance >= amount) {
      balance -= amount;
      recipient.balance += amount;
      return true;
    } else {
      return false;
    }
  }
}
