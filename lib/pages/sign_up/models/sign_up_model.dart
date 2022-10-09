class SignUpModel {
  SignUpModel({
    required this.status,
    required this.payload,
  });

  int status;
  SignUp payload;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        status: json["status"],
        payload: SignUp.fromJson(json["payload"]),
      );
}

class SignUp {
  SignUp({
    required this.name,
    required this.phone,
    required this.message,
  });

  String name;
  String phone;
  String message;

  factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
        name: json["name"] ?? '',
        phone: json["phone"] ?? '',
        message: json["message"] ?? '',
      );
}
