import 'package:wework/blocs/now_playing_movies/states/movies_state.dart';

class MovieInitState extends MoviesState {
  MovieInitState() : super(movies: []);

  @override
  List<Object> get props => [];
}
