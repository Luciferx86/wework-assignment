import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/enums/movie_loading_status.dart';
import 'package:wework/enums/movie_type_enum.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/events/movies_event.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/states/now_playing_movies_state.dart';
import 'package:wework/services/movies_repo.dart';

class NowPlayingMoviesBloc extends Bloc<MoviesEvent, NowPlayingMoviesState> {
  final MoviesRepo moviesRepo;

  NowPlayingMoviesBloc({required this.moviesRepo})
      : super(const NowPlayingMoviesState()) {
    on<FetchMoviesEvent>(_mapFetchMoviesEventToState);
    on<PageChangedEvent>(_mapPageChnagedEventToState);
  }

  void _mapFetchMoviesEventToState(
    FetchMoviesEvent event,
    Emitter<NowPlayingMoviesState> emit,
  ) async {

    var pageNumber = event.reFetch ? 0 : state.pageNumber;
    if (pageNumber == 0) {
      emit(state.copyWith(status: MoviesLoadingStatus.loading));
    }
    try {
      final movies = await moviesRepo.getMovies(
        movieType: MovieType.NOW_PLAYING,
        pageNumber: pageNumber + 1,
      );
      emit(state.copyWith(
        status: MoviesLoadingStatus.success,
        movies: [...state.movies, ...movies],
        pageNumber: pageNumber + 1,
      ));
    } catch (e) {
      emit(state.copyWith(status: MoviesLoadingStatus.error));
    }
  }

  void _mapPageChnagedEventToState(
    PageChangedEvent event,
    Emitter<NowPlayingMoviesState> emit,
  ) =>
      emit(state.copyWith(activePageIndex: event.page));
}
