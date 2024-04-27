import 'package:flutter/material.dart';
import 'package:wework/widgets/blutty_container.dart';
import 'package:wework/widgets/movie_curly_card.dart/movie_card_sub_curly_clipper.dart';

class MovieSubCardCurly extends StatelessWidget {
  // final String imageURL;
  final bool isFlipped;
  final double scale;
  final Widget? child;

  const MovieSubCardCurly({
    Key? key,
    this.child,
    // required this.imageURL,
    this.isFlipped = false,
    this.scale = 1,
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
            // child: CachedNetworkImage(imageUrl: imageURL, fit: BoxFit.contain),
            clipper: MovieCardSubCurlyClipper(
              isFlipped: isFlipped,
            ),
            // child: CachedNetworkImage(imageUrl: imageURL, fit: BoxFit.contain),
            child: BlurryContainer(
              color: Colors.black.withOpacity(0.6),
              child: child ?? const SizedBox.shrink(),
            ),
          ),
        ),
        const Positioned(
          top: 6,
          right: 74,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 6,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.subtitles_outlined,
                      size: 16,
                      color: Colors.white,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "English",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        // letterSpacing: 0,
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
