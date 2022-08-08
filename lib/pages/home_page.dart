// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:infofilm_app/controllers/movie_controller.dart';
import 'package:infofilm_app/repository/movie_repository_Imp.dart';
import 'package:infofilm_app/service/dio_service_imp.dart';
import 'package:lottie/lottie.dart';
import '../models/movies_model.dart';
import '../widgets/custom_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    (MoviesRepositoryImp(
      DioServiceImp(),
    )),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              ValueListenableBuilder<Filmes?>(
                valueListenable: _controller.movies,
                builder: (__, movies, _) {
                  return Visibility(
                    visible: movies != null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Filmes',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.grey.withOpacity(0.05),
                                Colors.grey.withOpacity(0.15),
                                Colors.grey.withOpacity(0.05),
                              ],
                              stops: const [0, 7, 1],
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  onChanged: _controller.onChanged,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    fillColor: Colors.white30,
                                    focusColor: Colors.white30,
                                    hoverColor: Colors.white30,
                                  ),
                                  cursorColor: Colors.white30,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              ValueListenableBuilder<Filmes?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: movies.listFilmes.length,
                          itemBuilder: (_, idx) => CustomListCardWidget(
                              movie: movies.listFilmes[idx]),
                          separatorBuilder: (_, __) => Divider(),
                        )
                      : Lottie.network(
                          "https://assets9.lottiefiles.com/packages/lf20_wunyawao.json");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
