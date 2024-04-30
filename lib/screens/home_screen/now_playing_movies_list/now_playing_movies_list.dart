import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/enums/movie_loading_status.dart';
import 'package:wework/enums/movie_type_enum.dart';
import 'package:wework/screens/home_screen/bloc/events/home_events.dart';
import 'package:wework/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:wework/screens/home_screen/bloc/state/home_state.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/movie_curly_card/movie_card_curly.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/movie_curly_card/movie_card_curly_shimmer.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/now_playing_index_counter.dart';
import 'package:wework/widgets/movie_error_widget.dart';
import 'package:wework/widgets/section_header.dart';

class NowPlayingMoviesList extends StatelessWidget {
  final PageController _pageController;

  NowPlayingMoviesList({super.key})
      : _pageController = PageController(viewportFraction: 0.75);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeState>(
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
            if (state.nowPlayingMoviesStatus.isError)
              const MovieErrorWidget(movieType: MovieType.NOW_PLAYING)
            else
              SizedBox(
                height: 340,
                child: PageView.builder(
                  padEnds: false,
                  pageSnapping: false,
                  physics: const BouncingScrollPhysics(),
                  controller: _pageController,
                  itemCount: state.nowPlayingMoviesStatus.isSuccess
                      ? state.nowPlayingMovies.length
                      : 5,
                  onPageChanged: (int page) {
                    context.read<HomeScreenBloc>().add(
                          PageChangedEvent(page: page),
                        );
                    if (state.nowPlayingMoviesStatus.isSuccess &&
                        page == state.nowPlayingMovies.length - 1) {
                      context.read<HomeScreenBloc>().add(
                            const FetchMoviesEvent(
                              movieType: MovieType.NOW_PLAYING,
                            ),
                          );
                    }
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return state.nowPlayingMoviesStatus.isSuccess
                        ? MovieCardCurly(
                            movie: state.nowPlayingMovies[index],
                          )
                        : const MovieCardCurlyShimmer();
                  },
                ),
              ),
            const SizedBox(height: 16),
            if (state.nowPlayingMoviesStatus.isSuccess)
              NowPlayingIndexCounter(
                currentIndex: state.carousalPageIndex,
                length: state.nowPlayingMovies.length,
              ),
          ],
        );
      },
    );
  }
}
