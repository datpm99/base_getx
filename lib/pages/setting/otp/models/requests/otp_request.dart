import 'dart:convert';

class OtpRequest {
  OtpRequest({
    required this.phone,
    required this.password,
    required this.otp,
  });

  String phone;
  String password;
  String otp;

  Map<String, dynamic> toMap() => {
        "phone": phone,
        "password": password,
        "otp": otp,
      };

  String toJson() => json.encode(toMap());
}
