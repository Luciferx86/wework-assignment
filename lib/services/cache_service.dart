import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wework/enums/movie_type_enum.dart';
import 'package:wework/models/movie_model.dart';

abstract class CacheService {
  Future<void> initialise();
  Future<void> storeMovies({
    required List<Movie> movies,
    required MovieType movieType,
  });

  Future<List<Movie>?> getMovies({required MovieType movieType});
}

class CacheServiceImpl implements CacheService {
  static final CacheServiceImpl _singleton = CacheServiceImpl._internal();

  factory CacheServiceImpl() => _singleton;

  CacheServiceImpl._internal();

  late SharedPreferences _sharedPreferences;

  @override
  Future<void> initialise() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> storeMovies({
    required List<Movie> movies,
    required MovieType movieType,
  }) async {
    await _sharedPreferences.setStringList(
      movieType.dbKey,
      movies.map((movie) => jsonEncode(movie.toJson())).toList(),
    );
  }

  @override
  Future<List<Movie>?> getMovies({required MovieType movieType}) async {
    List<String>? movies = _sharedPreferences.getStringList(movieType.dbKey);
    if (movies != null) {
      return movies.map((movie) => Movie.fromJson(jsonDecode(movie))).toList();
    }
    return null;
  }
}
