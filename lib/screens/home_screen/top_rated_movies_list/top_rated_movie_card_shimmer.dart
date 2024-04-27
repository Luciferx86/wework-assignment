import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wework/widgets/bordered_container.dart';

class TopRatedMovieCardShimmer extends StatelessWidget {
  const TopRatedMovieCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(26),
      ),
      color: Colors.grey[400],
      elevation: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: Stack(
              children: [
                Shimmer.fromColors(
                  highlightColor: const Color(0xff707070).withOpacity(0.3),
                  baseColor: const Color(0xff707070).withOpacity(0.6),
                  child: const BorderedContainer(
                    height: 170,
                    width: double.infinity,
                    radius: 24,
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 10,
                  child: Shimmer.fromColors(
                    highlightColor: const Color(0xff707070).withOpacity(0.3),
                    baseColor: const Color(0xff707070).withOpacity(0.6),
                    child: const BorderedContainer(
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Shimmer.fromColors(
            highlightColor: const Color(0xff707070).withOpacity(0.3),
            baseColor: const Color(0xff707070).withOpacity(0.6),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BorderedContainer(
                    height: 20,
                    width: 220,
                  ),
                  const SizedBox(height: 12),
                  const BorderedContainer(
                    height: 40,
                    width: 400,
                    radius: 20,
                  ),
                  const SizedBox(height: 12),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        const BorderedContainer(
                          height: 20,
                          width: 120,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: VerticalDivider(
                            color: Theme.of(context).hintColor,
                            indent: 2,
                            endIndent: 2,
                          ),
                        ),
                        const BorderedContainer(
                          height: 20,
                          width: 45,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
