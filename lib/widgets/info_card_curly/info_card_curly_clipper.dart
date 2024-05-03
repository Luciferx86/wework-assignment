import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class InfoCardCurlyClipper extends CustomClipper<Path> {
  final double scale;
  InfoCardCurlyClipper({
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
    return "M155 1C140.088 1 128 13.0883 128 28C128 28 127.5 33 124 37.5C121.943 40.1451 115.912 41.4082 111.29 42H28C13.0883 42 1 54.0883 1 69V115C1 129.912 13.0883 142 28 142H231C245.912 142 258 129.912 258 115V100.184C258.6 98.3236 259.811 95.314 262 92.5C263.38 90.7257 266.626 89.651 270.051 89H278C292.912 89 305 76.9117 305 62V28C305 13.0883 292.912 1 278 1H155Z";
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
