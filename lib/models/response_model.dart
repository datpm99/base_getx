import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

class ResponseModel {
  ResponseModel({
    required this.status,
    required this.message,
    required this.error,
    required this.data,
  });

  int status;
  String message;
  String error;
  String data;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        status: json["status"] ?? 0,
        message: json.containsKey("message") ? (json["message"] ?? '') : '',
        error: json.containsKey("error") ? (json["error"] ?? '') : '',
        data: json.containsKey("data") ? (json["data"] ?? '') : '',
      );
}
