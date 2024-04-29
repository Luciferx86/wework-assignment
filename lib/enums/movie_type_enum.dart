enum MovieType {
  NOW_PLAYING,
  TOP_RATED,
}

extension MovieTypeX on MovieType {
  String get apiPath {
    switch (this) {
      case MovieType.NOW_PLAYING:
        return "now_playing";
      case MovieType.TOP_RATED:
        return "top_rated";
    }
  }

  String get title {
    switch (this) {
      case MovieType.NOW_PLAYING:
        return "Now Playing";
      case MovieType.TOP_RATED:
        return "Top Rated";
    }
  }

  String get dbKey {
    switch (this) {
      case MovieType.NOW_PLAYING:
        return "now_playing_movies";
      case MovieType.TOP_RATED:
        return "top_rated_movies";
    }
  }
}
