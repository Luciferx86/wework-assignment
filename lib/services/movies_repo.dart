import 'dart:convert';

import 'package:wework/enums/movie_type_enum.dart';
import 'package:wework/models/movie_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:wework/utils/constants.dart';

abstract class MoviesRepo {
  Future<List<Movie>> getMovies({required MovieType movieType});
}

class MoviesRepoImpl implements MoviesRepo {
  // static const _baseUrl = "api.themoviedb.org/3";
  // static const String _GET_MOVIES = "movie/now_playing?language=en-US&page=1";
  @override
  Future<List<Movie>> getMovies({required MovieType movieType}) async {
    Uri uri = Uri.parse(
        "https://api.themoviedb.org/3/movie/${movieType == MovieType.NOW_PLAYING ? "now_playing" : "top_rated"}?language=en-US&page=1");
    // Uri uri = Uri.https(_baseUrl, _GET_MOVIES);
    Response response = await http.get(
      uri,
      headers: {
        "Authorization": "Bearer ${Constants.API_BEARER_TOKEN}",
        "accept": "application/json",
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      return (data['results'] as List)
          .map((data) => Movie.fromJson(data))
          .toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }
}
