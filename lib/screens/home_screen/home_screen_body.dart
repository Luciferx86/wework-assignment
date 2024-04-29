import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/enums/movie_loading_status.dart';
import 'package:wework/models/movie_model.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/now_playing_movies_bloc.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/events/movies_event.dart';
import 'package:wework/screens/home_screen/info_section.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/now_playing_movies_list.dart';
import 'package:wework/screens/home_screen/search_movies_bottomsheet/search_movie_bottomsheet.dart';
import 'package:wework/screens/home_screen/search_widget.dart';
import 'package:wework/screens/home_screen/top_rated_movies_list/bloc/top_rated_movies_bloc.dart.dart';
import 'package:wework/screens/home_screen/top_rated_movies_list/top_rated_movies_list.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<NowPlayingMoviesBloc>().add(const FetchMoviesEvent());
    context.read<TopRatedMoviesBloc>().add(const FetchMoviesEvent());
    _scrollController.addListener(_scrollChange);
  }

  _scrollChange() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange &&
        context.read<TopRatedMoviesBloc>().state.status.isSuccess) {
      context.read<TopRatedMoviesBloc>().add(const FetchMoviesEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<NowPlayingMoviesBloc>()
            .add(const CleanAndReFetchMoviesEvent());
        context
            .read<TopRatedMoviesBloc>()
            .add(const CleanAndReFetchMoviesEvent());
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const SizedBox(height: 16),
            InkWell(
                onTap: () {
                  showSearchMovieBottomsheet();
                },
                child: const SearchWidget()),
            const InfoSection(),
            NowPlayingMoviesList(),
            const SizedBox(height: 24),
            const TopRatedMoviesList(),
            const SizedBox(height: 44),
          ],
        ),
      ),
    );
  }

  Future<bool?> showSearchMovieBottomsheet() async {
    Movie? movie = await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (BuildContext childContext) => SearchMovieBottomsheet(
        nowPlayingMovies: context.read<NowPlayingMoviesBloc>().state.movies,
        topRatedMovies: context.read<TopRatedMoviesBloc>().state.movies,
      ),
    );
    if (movie != null) {
      // return await showMovieDetails(
      //   context: context,
      //   track: track,
      //   playlistController: playlistController,
      // );
    }
    return null;
  }
}
