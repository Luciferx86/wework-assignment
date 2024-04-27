import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class MovieCardSubCurlyClipper extends CustomClipper<Path> {
  final double scale;
  MovieCardSubCurlyClipper({
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
    return "M315 169.636V183C315 205.091 297.091 223 275 223H24C11.2975 223 1 212.703 1 200V62C1 49.2975 11.2975 39 24 39H165.962C170.663 38.4561 177.317 37.2054 179.5 34.3992C181.464 31.8737 182.484 29.1907 183 27.3225V24C183 11.2975 193.297 1 206 1H380C392.703 1 403 11.2975 403 24V92C403 114.091 385.091 132 363 132H356C355.206 132.113 354.373 132.224 353.514 132.338C350.583 132.726 347.346 133.154 344.314 133.883C340.596 134.777 337.426 136.222 335.748 136.987C335.059 137.301 334.621 137.5 334.5 137.5C334.5 137.5 331 138.5 326.5 142.5C326.347 142.636 326.194 142.771 326.039 142.907C324.173 144.55 322.18 146.306 320.5 150C318.755 153.839 318.51 154.73 317.586 158.105C317.306 159.126 316.965 160.374 316.5 162C315.76 164.775 315.294 167.414 315 169.636Z";
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
