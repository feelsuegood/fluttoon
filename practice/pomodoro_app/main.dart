import 'package:flutter/material.dart';
import 'package:fluttoon/screens/home_screen.dart';

void main() {
  runApp(App());
}

// * st -> then choose option to create widget
class App extends StatelessWidget {
  const App({super.key});

  // ui part
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffE7626C),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(color: Color(0xff232B55)),
        ),
        cardColor: const Color(0xffF4EDDB),
      ),
      home: HomeScreen(),
    );
  }
}
