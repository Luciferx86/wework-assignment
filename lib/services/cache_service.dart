import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wework/enums/movie_type_enum.dart';
import 'package:wework/models/movie_model.dart';
import 'package:wework/models/user_location.dart';
import 'package:wework/utils/constants.dart';

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
      movies.map((movie) => movie.toJson().toString()).toList(),
    );
  }

  Future<List<Movie>?> getMovies({required MovieType movieType}) async {
    List<String>? movies = _sharedPreferences.getStringList(movieType.dbKey);
    if (movies != null) {
      return movies.map((movie) => Movie.fromJson(jsonDecode(movie))).toList();
    }
    return null;
  }

  Future<void> storeLastFetchedLocation({
    required UserLocation userLocation,
  }) async {
    await _sharedPreferences.setStringList(
      Constants.USER_LOCATION_DB_KEY,
      [userLocation.mainAddress, userLocation.subAddress],
    );
  }

  Future<UserLocation?> getLastFetchedLocation() async {
    try {
      List<String>? location =
          _sharedPreferences.getStringList(Constants.USER_LOCATION_DB_KEY);
      if (location != null && location.length == 2) {
        return UserLocation(
          mainAddress: location[0],
          subAddress: location[1],
        );
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
