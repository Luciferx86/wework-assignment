import 'package:equatable/equatable.dart';
import 'package:wework/enums/movie_type_enum.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadInitialState extends HomeEvent {
  const LoadInitialState();

  @override
  List<Object?> get props => [];
}

class FetchMoviesEvent extends HomeEvent {
  final MovieType movieType;
  const FetchMoviesEvent({required this.movieType});

  @override
  List<Object?> get props => [movieType];
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

class SearchQueryChangedEvent extends HomeEvent {
  final String query;
  const SearchQueryChangedEvent({required this.query});

  @override
  List<Object?> get props => [query];
}
