import 'package:banking/models/user.dart';

class Employee extends UserModel {
  double salary;

  Employee({
    required String uId,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String dateOfBirth,
    required this.salary,
  }) : super(
          uId: uId,
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          phone: phone,
          dateOfBirth: dateOfBirth,
        );
}
