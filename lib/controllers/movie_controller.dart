import 'package:flutter/cupertino.dart';
import 'package:infofilm_app/repository/movies_repository.dart';

import '../models/movies_model.dart';

class MovieController {
  final MoviesRepository _moviesRepository;
  MovieController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Filmes?> movies = ValueNotifier<Filmes?>(null);
  Filmes? _cachedFilmes;

  onChanged(String value) {
    List<NameFilme> list = _cachedFilmes!.listFilmes
        .where(
          (e) => e.toString().toLowerCase().contains(
                value.toLowerCase(),
              ),
        )
        .toList();
    movies.value = movies.value!.copyWith(listFilmes: list);
  }

  fetch() async {
    movies.value = await _moviesRepository.getMovies();
    _cachedFilmes = movies.value;
  }
}
