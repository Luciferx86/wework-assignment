import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/now_playing_movies_bloc.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/states/movies_state.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/movie_curly_card/movie_card_curly.dart';
import 'package:wework/widgets/section_header.dart';

class NowPlayingMoviesList extends StatefulWidget {
  const NowPlayingMoviesList({super.key});

  @override
  State<NowPlayingMoviesList> createState() => _NowPlayingMoviesListState();
}

class _NowPlayingMoviesListState extends State<NowPlayingMoviesList> {
  final PageController _pageController = PageController(
    viewportFraction: 0.75,
  );

  int _activePage = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMoviesBloc, MoviesState>(
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
            SizedBox(
              height: 340,
              child: PageView.builder(
                padEnds: false,
                pageSnapping: false,
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                itemCount: 20,
                onPageChanged: (int page) {
                  setState(() {
                    _activePage = page;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return MovieCardCurly(
                    movie: state.movies[index],
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(99),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Text(
                  "${_activePage + 1}/${state.movies.length}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
