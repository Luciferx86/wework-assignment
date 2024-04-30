import 'dart:convert';

import 'package:wework/enums/movie_type_enum.dart';
import 'package:wework/models/movie_model.dart';
import 'package:http/http.dart';
import 'package:wework/services/http_service.dart';
import 'package:wework/utils/constants.dart';

abstract class HomeRepo {
  Future<List<Movie>> getMovies({
    required MovieType movieType,
    int pageNumber,
  });
}

class HomeRepoImpl implements HomeRepo {
  final HttpService httpService;

  HomeRepoImpl() : httpService = HttpService(Constants.BASE_URL);
  @override
  Future<List<Movie>> getMovies({
    required MovieType movieType,
    int pageNumber = 1,
  }) async {
    Response response = await httpService.getRequest(
      "/movie/${movieType.apiPath}?language=en-US&page=$pageNumber",
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
