// enum MoviesEvent {
//   fetchMovies,
// }

import 'package:equatable/equatable.dart';
import 'package:wework/enums/movie_type_enum.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class FetchMoviesEvent extends MoviesEvent {
  final MovieType movieType;
  const FetchMoviesEvent({required this.movieType});

  @override
  List<Object?> get props => [movieType];
}

class PageChangedEvent extends MoviesEvent {
  final int page;
  const PageChangedEvent({required this.page});

  @override
  List<Object?> get props => [page];
}
