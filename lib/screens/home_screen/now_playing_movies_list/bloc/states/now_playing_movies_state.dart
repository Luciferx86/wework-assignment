import 'package:wework/enums/movie_loading_status.dart';
import 'package:wework/models/movie_model.dart';
import 'package:wework/screens/home_screen/top_rated_movies_list/bloc/states/movies_state.dart';

class NowPlayingMoviesState extends MoviesState {
  final int activePageIndex;
  const NowPlayingMoviesState({
    super.pageNumber = 0,
    super.status = MoviesLoadingStatus.initial,
    super.movies = const [],
    this.activePageIndex = 0,
  });

  @override
  NowPlayingMoviesState copyWith({
    List<Movie>? movies,
    MoviesLoadingStatus? status,
    int? pageNumber,
    int? activePageIndex,
  }) {
    return NowPlayingMoviesState(
      movies: movies ?? this.movies,
      status: status ?? this.status,
      activePageIndex: activePageIndex ?? this.activePageIndex,
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }

  @override
  List<Object?> get props => [movies, status, pageNumber, activePageIndex];
}
