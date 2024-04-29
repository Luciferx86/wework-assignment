import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class FetchMoviesEvent extends MoviesEvent {
  const FetchMoviesEvent();

  @override
  List<Object?> get props => [];
}

class PageChangedEvent extends MoviesEvent {
  final int page;
  const PageChangedEvent({required this.page});

  @override
  List<Object?> get props => [page];
}

class CleanAndReFetchMoviesEvent extends MoviesEvent {
  const CleanAndReFetchMoviesEvent();

  @override
  List<Object?> get props => [];
}
