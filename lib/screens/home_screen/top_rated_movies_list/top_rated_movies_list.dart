import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/enums/movie_type_enum.dart';
import 'package:wework/enums/movie_loading_status.dart';
import 'package:wework/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:wework/screens/home_screen/bloc/state/home_state.dart';
import 'package:wework/screens/home_screen/top_rated_movies_list/top_rated_movie_card.dart';
import 'package:wework/screens/home_screen/top_rated_movies_list/top_rated_movie_card_shimmer.dart';
import 'package:wework/widgets/movie_error_widget.dart';
import 'package:wework/widgets/section_header.dart';

class TopRatedMoviesList extends StatelessWidget {
  const TopRatedMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SectionHeader(
                title: "TOP RATED",
              ),
            ),
            if (state.topRatedMoviesStatus.isError)
              const MovieErrorWidget(movieType: MovieType.TOP_RATED)
            else
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: state.topRatedMoviesStatus.isSuccess
                      ? state.topRatedMovies.length
                      : 5,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext ctxt, int i) {
                    return state.topRatedMoviesStatus.isSuccess
                        ? TopRatedMovieCard(
                            movie: state.topRatedMovies[i],
                          )
                        : const TopRatedMovieCardShimmer();
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
