import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({super.key});

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 5,
    ).animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) _animationController.repeat();
    });

    _animationController.addListener(() {
      setState(() {});
    });
    onAnimationStart();
  }

  void onAnimationStart() {
    _animationController.forward(from: 0);
  }

  late Animation<double> _animation;
  late AnimationController _animationController;
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: CircularProgressIndicator(
        strokeWidth: 5,
        backgroundColor: Colors.transparent,
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
        value: _animation.value / 5,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
