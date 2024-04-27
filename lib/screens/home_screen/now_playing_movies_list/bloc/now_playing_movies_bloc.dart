import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/enums/movie_loading_status.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/events/movies_event.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/states/now_playing_movies_state.dart';
import 'package:wework/services/movies_repo.dart';

class NowPlayingMoviesBloc extends Bloc<MoviesEvent, NowPlayingMoviesState> {
  final MoviesRepo moviesRepo;

  NowPlayingMoviesBloc({required this.moviesRepo})
      : super(const NowPlayingMoviesState()) {
    on<FetchMoviesEvent>(_mapGetCategoriesEventToState);
    on<PageChangedEvent>(_mapPageChnagedEventToState);
  }

  void _mapGetCategoriesEventToState(
    FetchMoviesEvent event,
    Emitter<NowPlayingMoviesState> emit,
  ) async {
    emit(state.copyWith(status: MoviesLoadingStatus.loading));
    try {
      final movies = await moviesRepo.getMovies(movieType: event.movieType);
      emit(state.copyWith(status: MoviesLoadingStatus.success, movies: movies));
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
