import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/blocs/now_playing_movies/bloc.dart';
import 'package:wework/blocs/now_playing_movies/states/movies_state.dart';

class TopRatedMoviesList extends StatelessWidget {
  const TopRatedMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMoviesBloc, MoviesState>(
      builder: (context, state) {
        return Text("Movie Count: ${state.movies.length}");
      },
    );
  }
}
