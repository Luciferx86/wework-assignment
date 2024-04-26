import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class CurlyContainerClipper extends CustomClipper<Path> {
  final bool isFlipped;
  final double scale;
  CurlyContainerClipper({
    this.isFlipped = false,
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
    return "M155 1C142.06 1 131.246 10.1028 128.613 22.2541C128.234 23.4003 128 24.2606 128 24.5C128 24.5 128 32 124.5 36.5C122.11 39.5735 114.121 41.2475 109.297 42H28C13.0883 42 1 54.0883 1 69V115C1 129.912 13.0883 142 28 142H231C245.912 142 258 129.912 258 115V112.184C258.6 110.324 259.811 107.314 262 104.5C263.38 102.726 266.626 101.651 270.051 101H278C292.912 101 305 88.9117 305 74V28C305 13.0883 292.912 1 278 1H155Z";
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
