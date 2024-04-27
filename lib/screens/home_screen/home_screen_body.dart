import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/now_playing_movies_bloc.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/events/movies_event.dart';
import 'package:wework/enums/movie_type_enum.dart';
import 'package:wework/screens/home_screen/info_section.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/now_playing_movies_list.dart';
import 'package:wework/screens/home_screen/search_widget.dart';
import 'package:wework/screens/home_screen/top_rated_movies_list/bloc/top_rated_movies_bloc.dart.dart';
import 'package:wework/screens/home_screen/top_rated_movies_list/top_rated_movies_list.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  void initState() {
    context
        .read<NowPlayingMoviesBloc>()
        .add(const FetchMoviesEvent(movieType: MovieType.NOW_PLAYING));
    context
        .read<TopRatedMoviesBloc>()
        .add(const FetchMoviesEvent(movieType: MovieType.TOP_RATED));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          const SearchWidget(),
          const InfoSection(),
          NowPlayingMoviesList(),
          const SizedBox(height: 24),
          const TopRatedMoviesList(),
          const SizedBox(height: 44),
        ],
      ),
    );
  }
}
