import 'package:wework/enums/movie_loading_status.dart';
import 'package:wework/models/movie_model.dart';
import 'package:wework/screens/home_screen/top_rated_movies_list/bloc/states/movies_state.dart';

class NowPlayingMoviesState extends MoviesState {
  final int activePageIndex;
  const NowPlayingMoviesState({
    MoviesLoadingStatus status = MoviesLoadingStatus.initial,
    List<Movie> movies = const [],
    this.activePageIndex = 0,
  }) : super(
          status: status,
          movies: movies,
        );

  @override
  NowPlayingMoviesState copyWith({
    List<Movie>? movies,
    MoviesLoadingStatus? status,
    int? activePageIndex,
  }) {
    return NowPlayingMoviesState(
      movies: movies ?? this.movies,
      status: status ?? this.status,
      activePageIndex: activePageIndex ?? this.activePageIndex,
    );
  }

  @override
  List<Object?> get props => [movies, status, activePageIndex];
}
