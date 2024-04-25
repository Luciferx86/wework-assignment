import 'package:flutter/material.dart';
import 'package:wework/screens/splash_screen.dart/splash_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: false,
          // colorScheme: const ColorScheme.dark(
          //   secondary: Color(0xffcbf051),
          //   error: Color(0xffffd700),
          //   primary: Color(0xffcbf051),
          // )
      ),
      home: const SplashScreen(),
    );
  }
}
