import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/states/movies_state.dart';

class MoviesListError extends MoviesState {
  final String error;

  MoviesListError({required this.error}) : super(movies: []);

  @override
  List<Object> get props => [error];
}
