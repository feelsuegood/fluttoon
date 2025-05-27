import 'package:flutter/material.dart';
import 'package:fluttoon/screens/home_screen.dart';

void main() {
  runApp(App());
}

// * st -> then choose option to create widget
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
