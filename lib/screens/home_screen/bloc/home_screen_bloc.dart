import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/enums/movie_loading_status.dart';
import 'package:wework/enums/movie_type_enum.dart';
import 'package:wework/screens/home_screen/bloc/events/home_events.dart';
import 'package:wework/screens/home_screen/bloc/repo/home_repo.dart';
import 'package:wework/screens/home_screen/bloc/state/home_state.dart';
import 'package:wework/services/cache_service.dart';

class HomeScreenBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo homeRepo;

  HomeScreenBloc({required this.homeRepo}) : super(const HomeState()) {
    on<FetchMoviesEvent>(_mapFetchMoviesEventToState);
    on<PageChangedEvent>(_mapPageChangedEventToState);
    on<CleanAndReFetchMoviesEvent>(_mapCleanAndReFetchMoviesEventToState);
    on<SearchQueryChangedEvent>(_mapSearchQueryChangedEventToState);
  }

  void _mapFetchMoviesEventToState(
    FetchMoviesEvent event,
    Emitter<HomeState> emit,
  ) async {
    MovieType type = event.movieType;
    int pageNumber = type == MovieType.NOW_PLAYING
        ? state.nowPlayingPageNumber
        : state.topRatedPageNumber;
    if (pageNumber == 0) {
      if (type == MovieType.NOW_PLAYING) {
        emit(state.copyWith(
            nowPlayingMoviesStatus: MoviesLoadingStatus.loading));
      } else {
        emit(state.copyWith(topRatedMoviesStatus: MoviesLoadingStatus.loading));
      }
    }
    try {
      final movies = await homeRepo.getMovies(
        movieType: type,
        pageNumber: pageNumber + 1,
      );
      if (type == MovieType.NOW_PLAYING) {
        emit(state.copyWith(
          nowPlayingMoviesStatus: MoviesLoadingStatus.success,
          nowPlayingMovies: [
            ...state.nowPlayingMovies,
            ...movies,
          ],
          nowPlayingPageNumber: pageNumber + 1,
        ));
      } else {
        emit(state.copyWith(
          topRatedMoviesStatus: MoviesLoadingStatus.success,
          topRatedMovies: [
            ...state.topRatedMovies,
            ...movies,
          ],
          topRatedPageNumber: pageNumber + 1,
        ));
      }
      CacheService().storeMovies(
        movies: type == MovieType.NOW_PLAYING
            ? state.nowPlayingMovies
            : state.topRatedMovies,
        movieType: type,
      );
    } catch (e) {
      if (pageNumber == 0) {
        if (type == MovieType.NOW_PLAYING) {
          emit(state.copyWith(
            nowPlayingMoviesStatus: MoviesLoadingStatus.error,
          ));
        } else {
          emit(state.copyWith(
            topRatedMoviesStatus: MoviesLoadingStatus.error,
          ));
        }
      }
    }
  }

  void _mapPageChangedEventToState(
    PageChangedEvent event,
    Emitter<HomeState> emit,
  ) =>
      emit(state.copyWith(carousalPageIndex: event.page));

  void _mapCleanAndReFetchMoviesEventToState(
    CleanAndReFetchMoviesEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(
      nowPlayingMoviesStatus: MoviesLoadingStatus.loading,
      topRatedMoviesStatus: MoviesLoadingStatus.loading,
      nowPlayingMovies: [],
      topRatedMovies: [],
      nowPlayingPageNumber: 0,
      topRatedPageNumber: 0,
    ));
    add(const FetchMoviesEvent(movieType: MovieType.NOW_PLAYING));
    add(const FetchMoviesEvent(movieType: MovieType.TOP_RATED));
  }

  void _mapSearchQueryChangedEventToState(
    SearchQueryChangedEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.query));
  }
}
