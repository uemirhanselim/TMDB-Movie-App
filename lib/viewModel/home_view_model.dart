import 'package:flutter/cupertino.dart';
import 'package:tmdb_movie_app/service/tmdb_service.dart';

import '../model/movie.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    _service = TmdbService();
  }

  late final ITmdbService _service;

  Future<List<Movie>> getMovies() async {
    return await _service.getMovies();
  }
}
