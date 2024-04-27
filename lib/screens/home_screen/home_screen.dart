import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/blocs/now_playing_movies/bloc.dart';
import 'package:wework/screens/home_screen/home_screen_body.dart';
import 'package:wework/screens/home_screen/home_screen_bottom_nav_bar.dart';
import 'package:wework/services/movies_repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  animateTo({required int pageNumber}) {
    if (pageNumber >= 0 && pageNumber <= 2) {
      setState(() {
        selectedIndex = pageNumber;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomeScreenBottomNavBar(
        selectedIndex: selectedIndex,
        onChange: (index) => animateTo(pageNumber: index),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffA490A5),
              Color(0xffF1F1F1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<NowPlayingMoviesBloc>(
              create: (context) => NowPlayingMoviesBloc(
                moviesRepo: MoviesRepoImpl(),
              ),
            ),
          ],
          child: const HomeScreenBody(),
        ),
      ),
    );
  }
}
