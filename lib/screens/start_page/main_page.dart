import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/global_blocs/application_bloc/application_bloc.dart';
import 'package:wework/screens/splash_screen.dart/splash_screen.dart';
import 'package:wework/services/application_repo.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApplicationBloc(
        applicationRepo: ApplicationRepoImpl(),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Caros",
          useMaterial3: false,
          colorScheme: const ColorScheme.light(
            secondary: Color(0xffA490A5),
            error: Color(0xffffd700),
            primary: Color(0xffA490A5),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
