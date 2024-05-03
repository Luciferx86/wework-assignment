import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:wework/enums/movie_loading_status.dart';
import 'package:wework/enums/movie_type_enum.dart';
import 'package:wework/models/movie_model.dart';
import 'package:wework/screens/home_screen/bloc/events/home_events.dart';
import 'package:wework/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:wework/screens/home_screen/bloc/repo/home_repo.dart';
import 'package:wework/screens/home_screen/bloc/state/home_state.dart';
import 'package:wework/services/cache_service.dart';

class MockHomeRepo extends Mock implements HomeRepo {
  @override
  Future<List<Movie>> getMovies({
    required MovieType movieType,
    int pageNumber = 1,
  }) async {
    return [];
  }

  @override
  Future<HomeState?> loadCaches() async {
    return null;
  }
}

class MockCacheService extends Mock implements CacheService {}

void main() {
  group('HomeScreenBloc', () {
    late HomeScreenBloc homeScreenBloc;
    late MockHomeRepo mockHomeRepo;
    late MockCacheService mockCacheService;

    setUp(() {
      mockHomeRepo = MockHomeRepo();
      mockCacheService = MockCacheService();
      homeScreenBloc = HomeScreenBloc(
        homeRepo: mockHomeRepo,
        cacheService: mockCacheService,
      );
    });

    tearDown(() {
      homeScreenBloc.close();
    });

    blocTest<HomeScreenBloc, HomeState>(
      'emits [] when nothing is added',
      build: () => homeScreenBloc,
      expect: () => [],
    );

    blocTest<HomeScreenBloc, HomeState>(
      'emits [loading, success] when FetchMoviesEvent is added',
      build: () => homeScreenBloc,
      act: (bloc) =>
          bloc.add(const FetchMoviesEvent(movieType: MovieType.NOW_PLAYING)),
      expect: () => [
        const HomeState(nowPlayingMoviesStatus: MoviesLoadingStatus.loading),
        const HomeState(nowPlayingMoviesStatus: MoviesLoadingStatus.success),
      ],
    );

    // Add more tests for other events and states
  });
}
