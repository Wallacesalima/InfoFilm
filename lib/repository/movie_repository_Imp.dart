// ignore_for_file: file_names

import 'package:infofilm_app/models/movies_model.dart';
import 'package:infofilm_app/repository/movies_repository.dart';
import 'package:infofilm_app/service/dio_service.dart';
import 'package:infofilm_app/utils/apis_utils.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;
  MoviesRepositoryImp(this._dioService);

  @override
  Future<Filmes> getMovies() async {
    var results = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
    return Filmes.fromJson(results.data);
  }
}
