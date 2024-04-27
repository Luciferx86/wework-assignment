import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/movie_curly_card/movie_card_curly_clipper.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/movie_curly_card/movie_card_sub_curly_container.dart';
import 'package:wework/widgets/bordered_container.dart';

class MovieCardCurlyShimmer extends StatelessWidget {
  final Widget? child;

  const MovieCardCurlyShimmer({
    Key? key,
    this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: const Color(0xff707070).withOpacity(0.3),
      baseColor: const Color(0xff707070).withOpacity(0.6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: 340,
              width: 280,
              child: ClipPath(
                clipper: MovieCardCurlyClipper(),
                child: Shimmer.fromColors(
                  highlightColor: const Color(0xff707070).withOpacity(0.3),
                  baseColor: const Color(0xff707070),
                  child: Container(
                    color: Colors.black,
                    child: child,
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 8,
              left: 36,
              child: BorderedContainer(
                width: 60,
                height: 20,
              ),
            ),
            const Positioned(
              top: 8,
              right: 12,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BorderedContainer(
                    width: 60,
                    height: 20,
                  ),
                  SizedBox(width: 4),
                  BorderedContainer(
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ),
            const Positioned(
              bottom: 0,
              child: MovieSubCardCurly(
                languageCode: "en",
                child: SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
