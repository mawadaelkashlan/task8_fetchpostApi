import 'package:advanced_day8_http/posts/bloc/posts_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/post_bloc.dart';
import '../bloc/post_state.dart';

class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostInitial) {
            context.read<PostBloc>().add(FetchPosts());
            return Center(child: CircularProgressIndicator());
          } else if (state is PostLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ExpansionTile(
                  title: Text(post.title),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(post.body),
                          SizedBox(height: 16),
                          BlocProvider.value(
                            value: BlocProvider.of<PostBloc>(context),
                            child: CommentsSection(postId: post.id),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (state is PostError) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class CommentsSection extends StatelessWidget {
  final int postId;

  const CommentsSection({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostInitial) {
          context.read<PostBloc>().add(FetchComments(postId));
          return Center(child: CircularProgressIndicator());
        } else if (state is PostLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CommentsLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.comments.length,
            itemBuilder: (context, index) {
              final comment = state.comments[index];
              return ListTile(
                title: Text(comment.name),
                subtitle: Text(comment.body),
              );
            },
          );
        } else if (state is PostError) {
          return Center(child: Text(state.message));
        } else {
          return Container();
        }
      },
    );
  }
}
