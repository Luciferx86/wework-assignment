import 'package:equatable/equatable.dart';
import 'package:wework/enums/movie_type_enum.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchMoviesEvent extends HomeEvent {
  final MovieType movieType;
  const FetchMoviesEvent({required this.movieType});

  @override
  List<Object?> get props => [];
}

class PageChangedEvent extends HomeEvent {
  final int page;
  const PageChangedEvent({required this.page});

  @override
  List<Object?> get props => [page];
}

class CleanAndReFetchMoviesEvent extends HomeEvent {
  const CleanAndReFetchMoviesEvent();

  @override
  List<Object?> get props => [];
}
