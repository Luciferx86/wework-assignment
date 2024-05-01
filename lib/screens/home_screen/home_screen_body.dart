import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/enums/movie_type_enum.dart';
import 'package:wework/enums/movie_loading_status.dart';
import 'package:wework/screens/home_screen/bloc/events/home_events.dart';
import 'package:wework/screens/home_screen/bloc/home_screen_bloc.dart';
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
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<HomeScreenBloc>().add(const LoadInitialState());
    _scrollController.addListener(_scrollChange);
  }

  _scrollChange() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange &&
        context.read<HomeScreenBloc>().state.topRatedMoviesStatus.isSuccess) {
      context
          .read<HomeScreenBloc>()
          .add(const FetchMoviesEvent(movieType: MovieType.TOP_RATED));
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context
          .read<HomeScreenBloc>()
          .add(const CleanAndReFetchMoviesEvent()),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: GestureDetector(
            child: Column(
              children: [
                const SizedBox(height: 16),
                SearchWidget(onTextChanged: _onSearchChanged),
                const InfoSection(),
                NowPlayingMoviesList(),
                const SizedBox(height: 24),
                const TopRatedMoviesList(),
                const SizedBox(height: 44),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onSearchChanged(String query) async {
    context.read<HomeScreenBloc>().add(SearchQueryChangedEvent(query: query));
  }

  // return await showMovieDetails(
  //   context: context,
  //   track: track,
  //   playlistController: playlistController,
  // );
}
