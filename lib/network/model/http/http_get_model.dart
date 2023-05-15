class HttpGetModel {
  int userId;
  String title;
  String body;

  HttpGetModel({required this.userId, required this.title, required this.body});

  /// fromJson method will fit this json data into the Dart class object
  factory HttpGetModel.fromJson(Map<String, dynamic> json) {
    return HttpGetModel(
      userId: json['userId'] ?? 'Not Found',
      title: json['title'] ?? 'Not Found',
      body: json['body'] ?? 'Not Found',
    );
  }

  /// toJson will helpful when we need to send data over server from convert dart to json
  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId,
        'title': title,
        'body': body,
      };
}
