class OtpModel {
  OtpModel({
    required this.status,
    this.data,
  });

  int status;
  Otp? data;

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        status: json["status"] ?? 0,
        data: json.containsKey("data") ? Otp.fromJson(json["data"]) : null,
      );
}

class Otp {
  Otp({
    required this.id,
    required this.username,
    required this.phone,
    required this.accessToken,
    required this.message,
  });

  int id;
  String username;
  String phone;
  String accessToken;
  String message;

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        id: json["id"] ?? 0,
        username: json["username"] ?? '',
        phone: json["phone"] ?? '',
        accessToken: json["accessToken"] ?? '',
        message: json["message"] ?? '',
      );
}
