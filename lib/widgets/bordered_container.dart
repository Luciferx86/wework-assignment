import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  final double height;
  final double width;
  final double radius;

  const BorderedContainer({
    required this.height,
    required this.width,
    this.radius = 99,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
