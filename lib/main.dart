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
      theme: ThemeData(
        canvasColor: Colors.white,
        backgroundColor: Colors.white,
        accentColor: Colors.black54,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.black54,
            fontSize: 65,
            fontWeight: FontWeight.w800,
          ),
          headline3: TextStyle(
            color: Colors.black54,
            fontSize: 60,
            fontWeight: FontWeight.w700,
          ),
          headline4: TextStyle(
            color: Colors.black54,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black54,
        ),
      ),
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
