import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class FetchPosts extends PostEvent {}

class FetchPost extends PostEvent {
  final int id;

  FetchPost(this.id);

  @override
  List<Object> get props => [id];
}

class FetchComments extends PostEvent {
  final int postId;

  FetchComments(this.postId);

  @override
  List<Object> get props => [postId];
}
