import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/screens/home_screen/home_header.dart';
import 'package:wework/screens/home_screen/now_playing_movies_list/bloc/now_playing_movies_bloc.dart';
import 'package:wework/screens/home_screen/home_screen_body.dart';
import 'package:wework/screens/home_screen/home_screen_bottom_nav_bar.dart';
import 'package:wework/screens/home_screen/top_rated_movies_list/bloc/top_rated_movies_bloc.dart.dart';
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffA490A5),
        title: const HomeHeader(),
      ),
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
            BlocProvider<TopRatedMoviesBloc>(
              create: (context) => TopRatedMoviesBloc(
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
