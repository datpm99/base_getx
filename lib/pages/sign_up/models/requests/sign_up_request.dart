import 'dart:convert';

class SignUpRequest {
  SignUpRequest({
    required this.phone,
    required this.name,
    required this.password,
  });

  String phone;
  String name;
  String password;

  Map<String, dynamic> toMap() => {
        "phone": phone,
        "name": name,
        "password": password,
      };

  String toJson() => json.encode(toMap());
}
