import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/blocs/now_playing_movies/bloc.dart';
import 'package:wework/blocs/now_playing_movies/events/movies_event.dart';
import 'package:wework/enums/movie_type_enum.dart';
import 'package:wework/screens/home_screen/home_header.dart';
import 'package:wework/screens/home_screen/info_section.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/now_playing_movies_list.dart';
import 'package:wework/screens/home_screen/search_widget.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          const HomeHeader(),
          const SearchWidget(),
          const InfoSection(),
          NowPlayingMoviesList(),
          TopRatedMoviesList(),
        ],
      ),
    );
  }
}
