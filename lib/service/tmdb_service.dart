import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import '../model/genre.dart';
import '../model/movie.dart';
import 'api_keys.dart';

abstract class ITmdbService {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiKeys.baseURL));
  Future<List<Movie>> getMovies(int page);
  Future<List<Genre>> getGenres();
}

class TmdbService extends ITmdbService {
  @override
  Future<List<Movie>> getMovies(int page) async {
    try {
      final String pathNowPlaying =
          "movie/now_playing?api_key=${ApiKeys.apiKey}&page=$page";

      final response = await _dio.get(pathNowPlaying);

      if (response.statusCode == HttpStatus.ok) {
        var movies = response.data['results'] as List;
        
        List<Movie> movieList = movies.map((e) => Movie.fromJson(e)).toList();

        return movieList;
      } else {
        log("Status Code: ${response.statusCode} \n Status Message: ${response.statusMessage}");
      }
    } on DioError catch (e) {
      log("Error Message: $e");
    }
    throw UnimplementedError();
  }

  @override
  Future<List<Genre>> getGenres() async {
    try {
      final String pathGenre = "genre/movie/list?api_key=${ApiKeys.apiKey}";
      final response = await _dio.get(pathGenre);

      if (response.statusCode == HttpStatus.ok) {
        var genres = response.data['genres'] as List;
        List<Genre> movieList = genres.map((e) => Genre.fromJson(e)).toList();

        return movieList;
      } else {
        log("Status Code: ${response.statusCode} \n Status Message: ${response.statusMessage}");
      }
    } on DioError catch (e) {
      log("Error Message: $e");
    }
    throw UnimplementedError();
  }
}
