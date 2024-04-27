import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/states/movies_state.dart';

class MovieInitState extends MoviesState {
  MovieInitState() : super(movies: []);

  @override
  List<Object> get props => [];
}
