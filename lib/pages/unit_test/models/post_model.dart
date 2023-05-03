class PostModel {
  String title;
  String body;
  int userId;
  int id;

  PostModel({
    required this.title,
    required this.body,
    required this.userId,
    required this.id,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      PostModel(
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
        id: json["id"],
      );
}
