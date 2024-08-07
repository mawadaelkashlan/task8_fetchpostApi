import 'dart:convert';

class Comment {
  final int id;
  final String name;
  final String body;

  Comment({
    required this.id,
    required this.name,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      name: json['name'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'body': body,
    };
  }

  static List<Comment> fromJsonList(String jsonString) {
    final data = json.decode(jsonString);
    return List<Comment>.from(data.map((item) => Comment.fromJson(item)));
  }
}
