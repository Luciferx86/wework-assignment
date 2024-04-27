import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wework/models/movie_model.dart';
import 'package:wework/widgets/movie_curly_card.dart/movie_card_curly_clipper.dart';
import 'package:wework/widgets/movie_curly_card.dart/movie_card_sub_curly_container.dart';

class MovieCardCurly extends StatelessWidget {
  final Movie movie;
  final Widget? child;

  const MovieCardCurly({
    required this.movie,
    Key? key,
    this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 340,
            width: 280,
            child: ClipPath(
              clipper: MovieCardCurlyClipper(),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      "https://image.tmdb.org/t/p/w780${movie.backdropPath}",
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
          Positioned(
            top: 8,
            left: 30,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  movie.voteAverage.toStringAsFixed(2),
                  // "6.67",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 6,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.visibility_outlined,
                          size: 18,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          movie.popularity.toStringAsFixed(0),
                          // "716",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            letterSpacing: -1,
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
          Positioned(
            bottom: 0,
            child: MovieSubCardCurly(
              movie: movie,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 6,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.date_range_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        SizedBox(
                          width: 180,
                          child: Text(
                            movie.overview,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          movie.voteCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: -1,
                          ),
                        ),
                        const Text(
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
      ),
    );
  }
}
