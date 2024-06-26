import 'package:flutter/material.dart';
import 'package:wework/widgets/info_card_curly/info_card_curly_clipper.dart';

class InfoCardCurly extends StatelessWidget {
  final double scale;
  final Widget? child;

  const InfoCardCurly({
    Key? key,
    this.child,
    this.scale = 1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: ClipPath(
        clipper: InfoCardCurlyClipper(),
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
