import 'package:equatable/equatable.dart';
import 'package:wework/enums/movie_loading_status.dart';
import 'package:wework/models/movie_model.dart';

class HomeState extends Equatable {
  final int nowPlayingPageNumber;
  final int topRatedPageNumber;
  final List<Movie> nowPlayingMovies;
  final List<Movie> topRatedMovies;
  final MoviesLoadingStatus nowPlayingMoviesStatus;
  final MoviesLoadingStatus topRatedMoviesStatus;
  final int carousalPageIndex;
  const HomeState({
    this.nowPlayingMovies = const [],
    this.topRatedMovies = const [],
    this.nowPlayingMoviesStatus = MoviesLoadingStatus.initial,
    this.topRatedMoviesStatus = MoviesLoadingStatus.initial,
    this.nowPlayingPageNumber = 0,
    this.topRatedPageNumber = 0,
    this.carousalPageIndex = 0,
  });

  HomeState copyWith({
    List<Movie>? nowPlayingMovies,
    List<Movie>? topRatedMovies,
    MoviesLoadingStatus? nowPlayingMoviesStatus,
    MoviesLoadingStatus? topRatedMoviesStatus,
    int? nowPlayingPageNumber,
    int? topRatedPageNumber,
    int? carousalPageIndex,
  }) {
    return HomeState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      nowPlayingMoviesStatus:
          nowPlayingMoviesStatus ?? this.nowPlayingMoviesStatus,
      topRatedMoviesStatus: topRatedMoviesStatus ?? this.topRatedMoviesStatus,
      nowPlayingPageNumber: nowPlayingPageNumber ?? this.nowPlayingPageNumber,
      topRatedPageNumber: topRatedPageNumber ?? this.topRatedPageNumber,
      carousalPageIndex: carousalPageIndex ?? this.carousalPageIndex,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        topRatedMovies,
        nowPlayingMoviesStatus,
        topRatedMoviesStatus,
        nowPlayingPageNumber,
        topRatedPageNumber,
        carousalPageIndex,
      ];
}
