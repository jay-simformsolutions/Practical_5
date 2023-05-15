class HttpPostModel {
  String name;
  String job;
  String id;
  String createdAt;

  HttpPostModel({
    required this.name,
    required this.createdAt,
    required this.id,
    required this.job,
  });

  factory HttpPostModel.fromJson(Map<String, dynamic> json) {
    return HttpPostModel(
        name: json['name'],
        createdAt: json['createAt'] ?? DateTime.now().toString(),
        id: json['id'] ?? '0',
        job: json['job']);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'job': job,
        'id': id,
        'createdAt': createdAt,
      };
}
