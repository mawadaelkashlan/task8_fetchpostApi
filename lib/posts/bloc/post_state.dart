import 'package:advanced_day8_http/posts/models/post_model.dart';
import 'package:equatable/equatable.dart';
import '../models/comment.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;

  const PostLoaded(this.posts);

  @override
  List<Object> get props => [posts];
}

class SinglePostLoaded extends PostState {
  final Post post;

  const SinglePostLoaded(this.post);

  @override
  List<Object> get props => [post];
}

class CommentsLoaded extends PostState {
  final List<Comment> comments;

  const CommentsLoaded(this.comments);

  @override
  List<Object> get props => [comments];
}

class PostError extends PostState {
  final String message;

  const PostError(this.message);

  @override
  List<Object> get props => [message];
}
