import 'package:wework/blocs/now_playing_movies/states/movies_state.dart';

class MoviesLoadingState extends MoviesState {
  MoviesLoadingState() : super(movies: []);

  @override
  List<Object> get props => [];
}
