import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9999),
            border: Border.all(
              color: Colors.black,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          child: Stack(
            children: [
              const SizedBox(
                height: 212,
                width: 212,
                child: CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  "assets/images/logo_full.png",
                  width: 180,
                  height: 180,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
