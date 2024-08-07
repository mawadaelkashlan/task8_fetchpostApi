import 'package:advanced_day8_http/posts/bloc/post_bloc.dart';
import 'package:advanced_day8_http/posts/screens/posts_screen.dart';
import 'package:advanced_day8_http/posts/view_model/repository/post_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(postRepository: PostRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PostListScreen(),
      ),
    );
  }
}
