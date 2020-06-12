import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hidato/components/hex_grid.dart';

class PuzzleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Level 3",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Center(
                child: HexGridWidgetExample(
                  level: 0,
                ),
              ),
            ),
            IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.remove,
                        size: 50,
                      ),
                    ),
                    Container(
                      child: Text(
                        "3",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.add,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        print("Button Pressed");
                      },
                      child: Container(
                        child: Text(
                          "Solution",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        print("Button Pressed");
                      },
                      child: Container(
                        child: Text(
                          "Next Puzzle",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
