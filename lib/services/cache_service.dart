import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wework/enums/movie_type_enum.dart';
import 'package:wework/models/movie_model.dart';

class CacheService {
  static final CacheService _singleton = CacheService._internal();

  factory CacheService() => _singleton;

  CacheService._internal();

  late SharedPreferences _sharedPreferences;

  initialise() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> storeMovies({
    required List<Movie> movies,
    required MovieType movieType,
  }) async {
    await _sharedPreferences.setStringList(
      movieType.dbKey,
      movies.map((movie) => jsonEncode(movie.toJson())).toList(),
    );
  }

  Future<List<Movie>?> getMovies({required MovieType movieType}) async {
    List<String>? movies = _sharedPreferences.getStringList(movieType.dbKey);
    if (movies != null) {
      return movies.map((movie) => Movie.fromJson(jsonDecode(movie))).toList();
    }
    return null;
  }
}
