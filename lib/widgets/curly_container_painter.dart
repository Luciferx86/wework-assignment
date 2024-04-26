// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class SvgBackgroundPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
    
//     // Load the SVG file
//     final svgPicture = SvgPicture.asset(
//       'assets/your_svg_file.svg',
//       width: size.width,
//       height: size.height,
//     );

//     // Convert the SVG picture to a Picture, and then draw it onto the canvas
//     Svg
//     final picture = svgPicture.
//         .toPicture(size.width.toInt(), size.height.toInt());
//     canvas.drawPicture(picture);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false; // Assuming the background won't change
//   }
// }
