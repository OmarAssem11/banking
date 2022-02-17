class UserModel {
  late String uId;
  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late String phone;
  late String dateOfBirth;

  UserModel({
    required this.uId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.dateOfBirth,
  });

  UserModel.fromJson(Map<String, String> json) {
    uId = json['uId']!;
    firstName = json['firstName']!;
    lastName = json['lastName']!;
    email = json['email']!;
    password = json['password']!;
    phone = json['phone']!;
    dateOfBirth = json['dateOfBirth']!;
  }

  Map<String, String> toMap() {
    return {
      'uId': uId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phone': phone,
      'dateOfBirth': dateOfBirth,
    };
  }
}
