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

  // path copied from the custom svg
  String get _path {
    return "M190 1C170.333 1 153.981 15.1933 150.629 33.8956C150.111 35.8119 149.594 37.5842 149.199 38.9375C148.781 40.3695 148.5 41.3324 148.5 41.5C148.5 41.5 147 46.5 143 51C142.637 51.4079 142.268 51.8582 141.881 52.3295C140.376 54.1629 138.613 56.312 136 57.5C133.499 58.6373 128.7 59.4983 125.31 60H41C18.9086 60 1 77.9086 1 100V482C1 504.091 18.9086 522 41 522H275C297.091 522 315 504.091 315 482V468.636C315.294 466.414 315.76 463.775 316.5 461C316.965 459.374 317.306 458.126 317.586 457.105C318.51 453.73 318.755 452.839 320.5 449C322.18 445.306 324.173 443.55 326.039 441.907C326.194 441.771 326.348 441.636 326.5 441.5C331 437.5 334.5 436.5 334.5 436.5C334.621 436.5 335.059 436.301 335.748 435.987C337.426 435.222 340.596 433.777 344.314 432.883C347.346 432.155 350.583 431.726 353.514 431.338C354.373 431.224 355.206 431.113 356 431H363C385.091 431 403 413.091 403 391V41C403 18.9086 385.091 1 363 1H190Z";
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
