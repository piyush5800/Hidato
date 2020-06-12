import 'package:flutter/material.dart';
import 'package:hidato/screens/home_screen.dart';
import 'package:hidato/screens/puzzle_screen.dart';
import 'package:provider/provider.dart';
import 'package:hidato/data/current_data.dart';
import 'package:hidato/screens/level_complete_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CurrentData(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.white,
        backgroundColor: Colors.white,
        accentColor: Colors.black54,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.black54,
            fontSize: 65,
            fontWeight: FontWeight.w800,
          ),
          headline2: TextStyle(
            color: Colors.black54,
            fontSize: 18,
            fontWeight: FontWeight.w700,
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
      initialRoute: '/home',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/home':
            return PageTransition(
                child: HomeScreen(),
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 400));
            break;
          case '/puzzle':
            return PageTransition(
                child: PuzzleScreen(),
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 400));
            break;
          case '/levelComplete':
            return PageTransition(
                child: LevelCompleteScreen(),
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 400));
            break;
          default:
            return null;
        }
      },
    );
  }
}
