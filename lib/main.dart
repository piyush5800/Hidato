import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: '/',
        routes: {
          '/': (context) => LoadingScreen(),
          '/home': (context) => HomeScreen(),
          '/puzzle': (context) => PuzzleScreen(),
        },
      ),
    );
  }
}
