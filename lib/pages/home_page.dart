import 'package:flutter/material.dart';
import 'package:infofilm_app/controllers/movie_controller.dart';
import 'package:infofilm_app/repository/movie_repository_Imp.dart';
import 'package:infofilm_app/service/dio_service_imp.dart';
import '../models/movies_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller =
      MovieController(MoviesRepositoryImp(DioServiceImp()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Movies?>(
          valueListenable: _controller.movies,
          builder: (_, movies, __) {
            // ignore: unnecessary_null_comparison
            if (movies != null) {
              return Builder(builder: (context) {
                return ListView.builder(
                  itemCount: movies.listMovies.length,
                  itemBuilder: (_, idx) => Text(movies.listMovies[idx].title),
                );
              });
            } else {
              return Container();
            }
          }),
    );
  }
}
