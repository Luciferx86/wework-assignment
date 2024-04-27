import 'package:equatable/equatable.dart';
import 'package:wework/enums/movie_loading_status.dart';
import 'package:wework/models/movie_model.dart';

class MoviesState extends Equatable {
  final int pageNumber;
  final List<Movie> movies;
  final MoviesLoadingStatus status;
  const MoviesState({
    this.movies = const [],
    this.status = MoviesLoadingStatus.initial,
    this.pageNumber = 0,
  });

  MoviesState copyWith({
    List<Movie>? movies,
    MoviesLoadingStatus? status,
    int? pageNumber,
  }) {
    return MoviesState(
      movies: movies ?? this.movies,
      status: status ?? this.status,
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }

  @override
  List<Object?> get props => [movies, status, pageNumber];
}
