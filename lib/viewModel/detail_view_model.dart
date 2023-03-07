import 'package:flutter/cupertino.dart';
import 'package:tmdb_movie_app/service/tmdb_service.dart';

import '../model/genre.dart';

class DetailViewModel extends ChangeNotifier {
  DetailViewModel() {
    _service = TmdbService();
  }

  late final ITmdbService _service;
  List _chosedGenres = [];
  List get chosedGenres => _chosedGenres;

  Future<List<Genre>> getGenres() async {
    return await _service.getGenres();
  }
}
