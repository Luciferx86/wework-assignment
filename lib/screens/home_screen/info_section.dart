import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/enums/movie_loading_status.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/now_playing_movies_bloc.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/states/now_playing_movies_state.dart';
import 'package:wework/utils/common_utils.dart';
import 'package:wework/widgets/info_card_curly/info_card_curly.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 16,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              InfoCardCurly(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "We Movies",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        getStatusText(state),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 16,
                child: Text(
                  CommonUtils.getFormattedDate(
                    DateTime.now(),
                    pretty: false,
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String getStatusText(NowPlayingMoviesState state) {
    switch (state.status) {
      case MoviesLoadingStatus.initial:
        return "";
      case MoviesLoadingStatus.success:
        return "${state.movies.length} Movies are loaded in now playing";
      case MoviesLoadingStatus.error:
        return "Error loading movies";
      case MoviesLoadingStatus.loading:
        return "Loading Now Playing Movies...";
    }
  }
}
