import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/states/movies_state.dart';

class MoviesLoadingState extends MoviesState {
  MoviesLoadingState() : super(movies: []);

  @override
  List<Object> get props => [];
}
