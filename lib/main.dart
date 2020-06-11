import 'package:flutter/material.dart';
import 'package:hidato/screens/loading_screen.dart';
import 'package:hidato/screens/home_screen.dart';
import 'package:hidato/screens/puzzle_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: '/puzzle',
      routes: {
        '/': (context) => LoadingScreen(),
        '/home': (context) => HomeScreen(),
        '/puzzle': (context) => PuzzleScreen(),
      },
    );
  }
}
