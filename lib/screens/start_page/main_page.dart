import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/enums/application_error_type.dart';
import 'package:wework/enums/application_status.dart';
import 'package:wework/global_blocs/application_bloc/application_bloc.dart';
import 'package:wework/global_blocs/application_bloc/state/application_state.dart';
import 'package:wework/screens/home_screen/home_screen.dart';
import 'package:wework/screens/location_error_screen/location_error_screen.dart';
import 'package:wework/screens/no_internet_screen/no_internet_screen.dart';
import 'package:wework/screens/splash_screen.dart/splash_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: BlocListener<ApplicationBloc, ApplicationState>(
        listener: (context, state) {
          if (state.status == ApplicationStatus.success) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (f) => false,
            );
          } else if (state.status == ApplicationStatus.error) {
            late Widget widget;
            switch (state.applicationError) {
              case ApplicationErrorType.location_error:
                widget = const LocationErrorScreen();
                break;
              case ApplicationErrorType.no_internet:
              case ApplicationErrorType.other:
              case null:
                widget = const NoInternetScreen();
                break;
            }
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => widget,
              ),
            );
          }
        },
        child: const SplashScreen(),
      ),
    );
  }
}
