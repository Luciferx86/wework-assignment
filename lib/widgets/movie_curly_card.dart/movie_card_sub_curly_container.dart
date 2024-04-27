import 'package:flutter/material.dart';
import 'package:wework/models/movie_model.dart';
import 'package:wework/utils/common_utils.dart';
import 'package:wework/widgets/blutty_container.dart';
import 'package:wework/widgets/movie_curly_card.dart/movie_card_sub_curly_clipper.dart';

class MovieSubCardCurly extends StatelessWidget {
  final Movie movie;
  final Widget child;

  const MovieSubCardCurly({
    required this.movie,
    required this.child,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 140,
          width: 280,
          child: ClipPath(
            clipper: MovieCardSubCurlyClipper(),
            child: BlurryContainer(
                color: Colors.black.withOpacity(0.6), child: child),
          ),
        ),
        Positioned(
          top: 6,
          right: 74,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 6,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.subtitles_outlined,
                      size: 16,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      CommonUtils.getFullLanguage(
                        languageCode: movie.originalLanguage,
                      ),
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
