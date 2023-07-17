class SignInModel {
  SignInModel({
    required this.errorCode,
    required this.message,
    this.data,
  });

  int errorCode;
  String message;
  Data? data;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        errorCode: json["error_code"] ?? 0,
        message: json["message"] ?? '',
        data: json.containsKey("data") ? Data.fromJson(json["data"]) : null,
      );
}

class Data {
  Data({
    required this.token,
    required this.tokenTimeout,
    required this.message,
    required this.captcha,
  });

  String token;
  int tokenTimeout;
  String message;
  String captcha;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json.containsKey("token") ? json["token"] : '',
        tokenTimeout:
            json.containsKey("tokenTimeout") ? json["tokenTimeout"] : 0,
        message: json.containsKey("message") ? json["message"] : '',
        captcha: json.containsKey("captcha") ? json["captcha"] : '',
      );
}

class SignInModel2 {
  int? errorCode;
  String? message;
  Data? data;


}