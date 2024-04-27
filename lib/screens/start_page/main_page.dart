import 'package:flutter/material.dart';
import 'package:wework/screens/home_screen/home_screen.dart';

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
          secondary: Color(0xffcbf051),
          error: Color(0xffffd700),
          primary: Color(0xffcbf051),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
