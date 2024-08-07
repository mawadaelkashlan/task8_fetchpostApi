import 'package:advanced_day8_http/posts/bloc/posts_event.dart';
import 'package:advanced_day8_http/posts/view_model/repository/post_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_state.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(PostInitial()) {
    on<FetchPosts>(_onFetchPosts);
    on<FetchPost>(_onFetchPost);
    on<FetchComments>(_onFetchComments);
  }

  void _onFetchPosts(FetchPosts event, Emitter<PostState> emit) async {
    try {
      emit(PostLoading());
      final posts = await postRepository.fetchPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  void _onFetchPost(FetchPost event, Emitter<PostState> emit) async {
    try {
      emit(PostLoading());
      final post = await postRepository.fetchPost(event.id);
      emit(SinglePostLoaded(post));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  void _onFetchComments(FetchComments event, Emitter<PostState> emit) async {
    try {
      emit(PostLoading());
      final comments = await postRepository.fetchComments(event.postId);
      emit(CommentsLoaded(comments));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}
