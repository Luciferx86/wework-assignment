import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/events/movies_event.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/states/movies_init_state.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/states/movies_list_error_state.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/states/movies_loaded_state.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/states/movies_loading_state.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/states/movies_state.dart';
import 'package:wework/services/movies_repo.dart';

class NowPlayingMoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepo moviesRepo;

  NowPlayingMoviesBloc({required this.moviesRepo}) : super(MovieInitState()) {
    on<FetchMoviesEvent>(_mapGetCategoriesEventToState);
  }

  void _mapGetCategoriesEventToState(
    FetchMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    emit(MoviesLoadingState());
    try {
      final movies = await moviesRepo.getMovies(movieType: event.movieType);
      emit(MoviesLoadedState(movies: movies));
    } catch (e) {
      emit(MoviesListError(error: e.toString()));
    }
  }
}
