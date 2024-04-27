import 'package:equatable/equatable.dart';
import 'package:wework/enums/movie_loading_status.dart';
import 'package:wework/models/movie_model.dart';

class MoviesState extends Equatable {
  final List<Movie> movies;
  final MoviesLoadingStatus status;
  const MoviesState({
    this.movies = const [],
    this.status = MoviesLoadingStatus.initial,
  });

  MoviesState copyWith({List<Movie>? movies, MoviesLoadingStatus? status}) {
    return MoviesState(
      movies: movies ?? this.movies,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [movies, status];
}
