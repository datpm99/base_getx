import 'dart:convert';

class SignInRequest {
  SignInRequest({
    required this.phone,
    required this.password,
    required this.deviceId,
  });

  String phone;
  String password;
  String deviceId;

  Map<String, dynamic> toMap() => {
        "phone": phone,
        "password": password,
        "deviceId": deviceId,
      };

  String toJson() => json.encode(toMap());
}
