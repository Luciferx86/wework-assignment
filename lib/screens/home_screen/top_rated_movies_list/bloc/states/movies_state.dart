import 'package:equatable/equatable.dart';
import 'package:wework/models/movie_model.dart';

class MoviesState extends Equatable {
  final List<Movie> movies;
  const MoviesState({required this.movies});

  MoviesState copyWith({List<Movie>? movies}) {
    return MoviesState(
      movies: movies ?? this.movies,
    );
  }

  @override
  List<Object?> get props => [movies];
}
