import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable(includeIfNull: true)
class Movie {
  @JsonKey(name: "adult")
  bool adult;
  @JsonKey(name: "backdrop_path")
  String backdropPath;
  @JsonKey(name: "genre_ids")
  List<int> genreIds;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "original_language")
  String originalLanguage;
  @JsonKey(name: "original_title")
  String originalTitle;
  @JsonKey(name: "overview")
  String overview;
  @JsonKey(name: "popularity")
  double popularity;
  @JsonKey(name: "poster_path")
  String posterPath;
  @JsonKey(name: "release_date")
  DateTime releaseDate;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "video")
  bool video;
  @JsonKey(name: "vote_average")
  double voteAverage;
  @JsonKey(name: "vote_count")
  int voteCount;

  Movie({
        required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

  factory Movie.fromJson(Map<String, dynamic> json) =>
      _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
