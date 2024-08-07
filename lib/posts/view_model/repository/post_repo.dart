// repositories/post_repository.dart
import 'dart:convert';
import 'package:advanced_day8_http/posts/models/comment.dart';
import 'package:advanced_day8_http/posts/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode == 200) {
      return Post.fromJsonList(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<Post> fetchPost(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/posts/$id'));

    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<List<Comment>> fetchComments(int postId) async {
    final response = await http.get(Uri.parse('$baseUrl/posts/$postId/comments'));

    if (response.statusCode == 200) {
      return Comment.fromJsonList(response.body);
    } else {
      throw Exception('Failed to load comments');
    }
  }
}
