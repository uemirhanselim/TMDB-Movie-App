import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/service/tmdb_service.dart';
import 'package:tmdb_movie_app/view/detail_view.dart';

import '../model/movie.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    _service = TmdbService();
    getMovies();
    _scrollController.addListener(_scrollListener);
  }

  late final ITmdbService _service;
  List<Movie> _movies = [];
  List<Movie> _filteredList = [];
  final ScrollController _scrollController = ScrollController();
  ScrollController get controller => _scrollController;
  int _page = 1;

  List<Movie> get movies => _filteredList.isNotEmpty ? _filteredList : _movies;
  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;
  bool _isFirstLoading = true;

  bool _hasNextPage = true;

  Future<void> getMovies() async {
    if (_isFirstLoading == true) {
      _movies = await _service.getMovies(_page);
    }
    _isFirstLoading = false;
    notifyListeners();
  }

  Future<void> getNewMovies() async {
    List<Movie> newMovies = await _service.getMovies(_page);

    if (newMovies.isNotEmpty) {
      for (var item in newMovies) {
        _movies.add(item);
      }
    } else {
      _hasNextPage = false;
    }

    notifyListeners();
  }

  void onChangeFilter(String value) {
    if (value.length >= 2) {
      _filteredList = _movies
          .where((element) => element.title
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    } else {
      _filteredList = _movies;
    }
    notifyListeners();
  }

  Future<void> _scrollListener() async {
    if (_hasNextPage == true &&
        _isFirstLoading == false &&
        _isLoadingMore == false &&
        _scrollController.position.extentAfter < 300) {
      _isLoadingMore = true;
      _page = _page + 1;
      await getNewMovies();
      _isLoadingMore = false;
    }
  }

  void goToDetails(BuildContext context, Movie movie) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailView(movie: movie)));
  }
}
