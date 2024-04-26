import 'package:wework/blocs/now_playing_movies/states/movies_state.dart';

class MoviesLoadedState extends MoviesState {
  const MoviesLoadedState({required super.movies});

  @override
  List<Object> get props => [movies];
}
