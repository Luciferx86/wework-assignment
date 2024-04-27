import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/states/movies_state.dart';
import 'package:wework/screens/home_screen/top_rated_movies_list/bloc/top_rated_movies_bloc.dart.dart';
import 'package:wework/screens/home_screen/top_rated_movies_list/top_rated_movie_card.dart';
import 'package:wework/widgets/section_header.dart';

class TopRatedMoviesList extends StatelessWidget {
  const TopRatedMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesBloc, MoviesState>(
      builder: (context, state) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SectionHeader(
                title: "TOP RATED",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: state.movies.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext ctxt, int i) {
                  return TopRatedMovieCard(
                    movie: state.movies[i],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
