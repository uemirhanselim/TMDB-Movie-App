class Genre {
  int? id;
  String? name;
  Genre({this.id, this.name});

  factory Genre.fromJson(dynamic json) {
    if (json == null) {
      Genre();
    }

    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}
