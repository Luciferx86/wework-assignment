import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wework/widgets/curly_container_clipper.dart';

class CurlyContainer extends StatelessWidget {
  // final String imageURL;
  final bool isFlipped;
  final double scale;
  final Widget? child;

  const CurlyContainer({
    Key? key,
    this.child,
    // required this.imageURL,
    this.isFlipped = false,
    this.scale = 1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 325 * scale,
      child: ClipPath(
        // child: CachedNetworkImage(imageUrl: imageURL, fit: BoxFit.contain),
        clipper: CurlyContainerClipper(
          isFlipped: isFlipped,
        ),
        // child: CachedNetworkImage(imageUrl: imageURL, fit: BoxFit.contain),
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.2),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
