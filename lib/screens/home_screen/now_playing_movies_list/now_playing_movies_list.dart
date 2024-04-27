import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/enums/movie_loading_status.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/events/movies_event.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/now_playing_movies_bloc.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/states/now_playing_movies_state.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/movie_curly_card/movie_card_curly.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/movie_curly_card/movie_card_curly_shimmer.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/now_playing_index_counter.dart';
import 'package:wework/widgets/section_header.dart';

class NowPlayingMoviesList extends StatelessWidget {
  final PageController _pageController;

  NowPlayingMoviesList({super.key})
      : _pageController = PageController(viewportFraction: 0.75);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SectionHeader(
                title: "NOW PLAYING",
              ),
            ),
            const SizedBox(height: 16),
            if (state.status.isError)
              const SizedBox.shrink()
            else
              SizedBox(
                height: 340,
                child: PageView.builder(
                  padEnds: false,
                  pageSnapping: false,
                  physics: const BouncingScrollPhysics(),
                  controller: _pageController,
                  itemCount: state.status.isSuccess ? state.movies.length : 5,
                  onPageChanged: (int page) =>
                      context.read<NowPlayingMoviesBloc>().add(
                            PageChangedEvent(
                              page: page,
                            ),
                          ),
                  itemBuilder: (BuildContext context, int index) {
                    return state.status.isSuccess
                        ? MovieCardCurly(
                            movie: state.movies[index],
                          )
                        : const MovieCardCurlyShimmer();
                  },
                ),
              ),
            const SizedBox(height: 16),
            if (state.status.isSuccess)
              NowPlayingIndexCounter(
                currentIndex: state.activePageIndex,
                length: state.movies.length,
              ),
          ],
        );
      },
    );
  }
}
