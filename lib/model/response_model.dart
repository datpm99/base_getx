class ResponseModel {
  ResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  String data;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        status: json["status"] ?? 0,
        message: json.containsKey("message") ? (json["message"] ?? '') : '',
        data: json.containsKey("data") ? (json["data"] ?? '') : '',
      );
}
