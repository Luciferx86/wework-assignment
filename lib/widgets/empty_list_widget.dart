import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/empty_list.png",
            height: 60,
          ),
          const SizedBox(height: 14),
          const Text("No results found."),
        ],
      ),
    );
  }
}
