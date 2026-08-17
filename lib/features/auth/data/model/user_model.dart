class UserModel {
  final String uId;
  final String name;
  final String email;
  final String? phone;

  UserModel({
    required this.name,
    required this.email,
    this.phone,
    required this.uId,
  });

  Map<String, dynamic> toJson() => {
    'uId': uId,
    'name': name,
    'email': email,
    'phone': phone,
  };
}
