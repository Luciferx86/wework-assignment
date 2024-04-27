import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class MovieCardCurlyClipper extends CustomClipper<Path> {
  final double scale;
  MovieCardCurlyClipper({
    this.scale = 1,
  });
  @override
  Path getClip(Size size) {
    Path path = parseSvgPathData(_path);
    final Rect pathBounds = path.getBounds();
    final Matrix4 matrix4 = Matrix4.identity();
    matrix4.scale(size.width * scale / pathBounds.width,
        size.height * scale / pathBounds.height);
    return path.transform(matrix4.storage);
  }

  String get _path {
    return "M177 1C162.088 1 150 13.0883 150 28V33.6203C149.671 35.8553 149.244 38.1974 148.93 39.9213L148.93 39.9232C148.679 41.2999 148.5 42.282 148.5 42.5C148.5 42.5 146.5 49 142.5 53.5C139.542 56.8279 131.662 59.062 127.757 60H28C13.0883 60 1 72.0883 1 87V495C1 509.912 13.0883 522 28 522H288C302.912 522 315 509.912 315 495V449.862C315.413 447.105 315.5 444.415 315.5 444C315.5 444 316.5 439 320 434.5C321.38 432.726 324.626 431.651 328.051 431H376C390.912 431 403 418.912 403 404V28C403 13.0883 390.912 1 376 1H177Z";
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
