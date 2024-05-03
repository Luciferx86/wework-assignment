import 'dart:convert';

import 'package:wework/enums/movie_loading_status.dart';
import 'package:wework/enums/movie_type_enum.dart';
import 'package:wework/models/movie_model.dart';
import 'package:http/http.dart';
import 'package:wework/screens/home_screen/bloc/state/home_state.dart';
import 'package:wework/services/cache_service.dart';
import 'package:wework/services/http_service.dart';
import 'package:wework/utils/constants.dart';

abstract class HomeRepo {
  Future<List<Movie>> getMovies({
    required MovieType movieType,
    required int pageNumber,
  });
  Future<HomeState?> loadCaches();
}

class HomeRepoImpl implements HomeRepo {
  final HttpService httpService;

  HomeRepoImpl() : httpService = HttpService(Constants.BASE_URL);

  @override
  Future<List<Movie>> getMovies({
    required MovieType movieType,
    required int pageNumber,
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

  @override
  Future<HomeState?> loadCaches() async {
    try {
      List caches = await Future.wait([
        CacheService().getMovies(
          movieType: MovieType.NOW_PLAYING,
        ),
        CacheService().getMovies(
          movieType: MovieType.TOP_RATED,
        ),
      ]);
      if (caches[0] == null || caches[1] == null) {
        return null;
      }
      return HomeState(
        nowPlayingMovies: caches[0] as List<Movie>,
        topRatedMovies: caches[1] as List<Movie>,
        nowPlayingMoviesStatus: MoviesLoadingStatus.success,
        topRatedMoviesStatus: MoviesLoadingStatus.success,
        carousalPageIndex: 0,
        nowPlayingPageNumber: (caches[0] as List<Movie>).length ~/ 20,
        topRatedPageNumber: (caches[1] as List<Movie>).length ~/ 20,
      );
    } catch (e) {
      return null;
    }
  }
}
