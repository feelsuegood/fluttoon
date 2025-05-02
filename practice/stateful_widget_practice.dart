import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

// hold a data
class _AppState extends State<App> {
  int counter = 0;

  void onClick() {
    // don't forget to add setState, also outside of setState works too
    // counter = counter + 1;
    // everytime call setState,build method runs again
    setState(() {
      counter = counter + 1;
    });
  }

  // ui part
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Ahead of Time: set before compiling
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Click count', style: TextStyle(fontSize: 30)),
              Text('$counter', style: TextStyle(fontSize: 30)),
              IconButton(
                iconSize: 40,
                onPressed: onClick,
                icon: Icon(Icons.add_box_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
