import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import '../model/movie.dart';
import 'api_keys.dart';

abstract class ITmdbService {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiKeys.baseURL));
  Future<List<Movie>> getMovies();
}

class TmdbService extends ITmdbService {
  final String _pathNowPlaying = "now_playing?api_key=${ApiKeys.apiKey}";
  
  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await _dio.get(_pathNowPlaying);

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
}
