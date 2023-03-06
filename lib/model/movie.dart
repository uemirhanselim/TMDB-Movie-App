class Movie {
  String? posterPath;
  bool? adult;
  String? overview;
  String? releaseDate;
  String? originalLanguage;
  double? popularity;
  int? voteCount;
  num? voteAverage;
  int? id;
  String? title;

  final String _imagePath = "https://image.tmdb.org/t/p/original";

  Movie({
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.originalLanguage,
    this.popularity,
    this.voteCount,
    this.voteAverage,
    this.id,
    this.title,
  });

  factory Movie.fromJson(dynamic json) {
    if (json == null) {
      return Movie();
    }

    return Movie(
      adult: json['adult'],
      id: json['id'],
      originalLanguage: json['original_language'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}
