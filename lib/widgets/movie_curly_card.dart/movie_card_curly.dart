import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wework/widgets/movie_curly_card.dart/movie_card_curly_clipper.dart';
import 'package:wework/widgets/movie_curly_card.dart/movie_card_sub_curly_container.dart';

class MovieCardCurly extends StatelessWidget {
  // final String imageURL;
  final bool isFlipped;
  final double scale;
  final Widget? child;

  const MovieCardCurly({
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
          height: 340,
          width: 280,
          child: ClipPath(
            // child: CachedNetworkImage(imageUrl: imageURL, fit: BoxFit.contain),
            clipper: MovieCardCurlyClipper(
              isFlipped: isFlipped,
            ),
            // child: CachedNetworkImage(imageUrl: imageURL, fit: BoxFit.contain),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const CachedNetworkImageProvider(
                    "https://picsum.photos/200/300",
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2),
                    BlendMode.srcOver,
                  ),
                ),
              ),
              child: child,
            ),
          ),
        ),
        const Positioned(
          top: 8,
          left: 30,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "6.67",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.star,
                size: 20,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
        Positioned(
          top: 8,
          right: 12,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 6,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.visibility_outlined,
                        size: 18,
                        color: Colors.white,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "716",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          letterSpacing: -1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(3),
                  child: Icon(
                    Icons.favorite_outline,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Positioned(
          bottom: 0,
          child: MovieSubCardCurly(
            child: Padding(
              padding: EdgeInsets.only(
                top: 30,
                left: 6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Godzilla x Kong: The New Empire",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.date_range_outlined,
                        size: 16,
                        color: Colors.white,
                      ),
                      SizedBox(width: 4),
                      SizedBox(
                        width: 180,
                        child: Text(
                          "Following their explosive shutdown, Godzilla and Kong must reunite to protect the world from a new threat.",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "716",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: -1.5,
                        ),
                      ),
                      Text(
                        " votes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
