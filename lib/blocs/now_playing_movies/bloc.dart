import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/blocs/now_playing_movies/events/movies_event.dart';
import 'package:wework/blocs/now_playing_movies/states/movies_init_state.dart';
import 'package:wework/blocs/now_playing_movies/states/movies_list_error_state.dart';
import 'package:wework/blocs/now_playing_movies/states/movies_loaded_state.dart';
import 'package:wework/blocs/now_playing_movies/states/movies_loading_state.dart';
import 'package:wework/blocs/now_playing_movies/states/movies_state.dart';
import 'package:wework/services/movies_repo.dart';

class NowPlayingMoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepo moviesRepo;

  NowPlayingMoviesBloc({required this.moviesRepo}) : super(MovieInitState()) {
    on<FetchMoviesEvent>(_mapGetCategoriesEventToState);
  }

  // @override
  // on<MoviesEvents>(MoviesEvents event, Emitter<MoviesState> emit) {}

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

  // @override
  // Stream<MoviesState> mapEventToState(MoviesEvents event) async* {
  //   switch (event) {
  //     case MoviesEvents.fetchMovies:
  //       yield MoviesLoadingState();
  //       try {
  //         final movies = await moviesRepo.getMovies();
  //         yield MoviesLoadedState(movies: movies);
  //       } catch (e) {
  //         yield MoviesListError(error: e.toString());
  //       }
  //       break;
  //   }
  // }
}
