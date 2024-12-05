class MovieModel {
    String backdropPath;
    int id;
    String title;
    String originalTitle;
    String overview;
    String posterPath;
    DateTime releaseDate;
    double voteAverage;
    List<int> genreIds;

    MovieModel({
        required this.backdropPath,
        required this.id,
        required this.title,
        required this.originalTitle,
        required this.overview,
        required this.posterPath,
        required this.releaseDate,
        required this.voteAverage,
        required this.genreIds,
    });

    factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        backdropPath: json["backdrop_path"] ?? "",
        id: json["id"],
        title: json["title"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"] ?? "",
        releaseDate: DateTime.parse(json["release_date"]),
        voteAverage: json["vote_average"]?.toDouble(),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "vote_average": voteAverage,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    };
}