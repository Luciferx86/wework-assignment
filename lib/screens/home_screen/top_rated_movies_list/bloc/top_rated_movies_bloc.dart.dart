import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/enums/movie_loading_status.dart';
import 'package:wework/enums/movie_type_enum.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/events/movies_event.dart';
import 'package:wework/screens/home_screen/top_rated_movies_list/bloc/states/movies_state.dart';
import 'package:wework/services/cache_service.dart';
import 'package:wework/services/movies_repo.dart';

class TopRatedMoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepo moviesRepo;

  TopRatedMoviesBloc({required this.moviesRepo}) : super(const MoviesState()) {
    on<FetchMoviesEvent>(_mapFetchMoviesEventToState);
    on<CleanAndReFetchMoviesEvent>(_mapCleanAndReFetchMoviesEventToState);
  }

  void _mapFetchMoviesEventToState(
    FetchMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    var pageNumber = state.pageNumber;
    if (pageNumber == 0) {
      emit(state.copyWith(status: MoviesLoadingStatus.loading));
    }
    try {
      final movies = await moviesRepo.getMovies(
        movieType: MovieType.TOP_RATED,
        pageNumber: pageNumber + 1,
      );
      emit(state.copyWith(
        status: MoviesLoadingStatus.success,
        movies: [
          ...state.movies,
          ...movies,
        ],
        pageNumber: pageNumber + 1,
      ));
      CacheService().storeMovies(
        movies: state.movies,
        movieType: MovieType.NOW_PLAYING,
      );
    } catch (e) {
      if (pageNumber == 0) {
        emit(state.copyWith(status: MoviesLoadingStatus.error));
      }
    }
  }

  void _mapCleanAndReFetchMoviesEventToState(
    CleanAndReFetchMoviesEvent event,
    Emitter<MoviesState> emit,
  ) {
    emit(state.copyWith(
      status: MoviesLoadingStatus.loading,
      movies: [],
      pageNumber: 0,
    ));
    add(const FetchMoviesEvent());
  }
}
