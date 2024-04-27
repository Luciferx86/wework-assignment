import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/states/movies_state.dart';

class MoviesLoadedState extends MoviesState {
  const MoviesLoadedState({required super.movies});

  @override
  List<Object> get props => [movies];
}
