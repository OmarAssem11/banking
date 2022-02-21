class UserModel {
  late String uId;
  late String name;
  late String email;
  late String password;
  late String phone;
  late String imageUrl;

  UserModel({
    required this.uId,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.imageUrl,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'] as String;
    name = json['name'] as String;
    email = json['email'] as String;
    password = json['password'] as String;
    phone = json['phone'] as String;
    imageUrl = json['imageUrl'] as String;
  }

  Map<String, String> toMap() {
    return {
      'uId': uId,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'imageUrl': imageUrl,
    };
  }
}
