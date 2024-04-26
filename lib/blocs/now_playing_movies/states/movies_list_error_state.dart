import 'package:wework/blocs/now_playing_movies/states/movies_state.dart';

class MoviesListError extends MoviesState {
  final String error;

  MoviesListError({required this.error}) : super(movies: []);

  @override
  List<Object> get props => [error];
}
