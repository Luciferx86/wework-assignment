import 'package:flutter/material.dart';
import 'package:wework/enums/movie_type_enum.dart';
import 'package:wework/widgets/primary_button.dart';

class MovieErrorWidget extends StatelessWidget {
  final MovieType movieType;
  final Function? onRetry;

  const MovieErrorWidget({
    required this.movieType,
    this.onRetry,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/movie_error.png",
            height: 120,
          ),
          Text("Error while loading ${movieType.title} movies"),
          const SizedBox(height: 16),
          SizedBox(
            width: 120,
            child: PrimaryButton(
              onPressed: () => onRetry?.call(),
              title: 'Retry',
            ),
          ),
        ],
      ),
    );
  }
}
