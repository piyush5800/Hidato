import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hidato/components/hex_grid.dart';
import 'package:provider/provider.dart';
import 'package:hidato/data/current_data.dart';

class PuzzleScreen extends StatefulWidget {
  @override
  _PuzzleScreenState createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  int level = 0;

  @override
  Widget build(BuildContext context) {
    //Provider.of<CurrentData>(context).setLevel(level);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Level ${Provider.of<CurrentData>(context).getLevel()}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Center(
                child: HexGridWidgetExample(
                  level: Provider.of<CurrentData>(context).getLevel(),
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
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<CurrentData>(context, listen: false)
                              .getPreviousNumber();
                        },
                        child: Icon(
                          Icons.remove,
                          size: 50,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "${Provider.of<CurrentData>(context).getCurrentNumber() != 19 ? Provider.of<CurrentData>(context).getCurrentNumber() : ''}",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<CurrentData>(context, listen: false)
                              .getNextNumber();
                        },
                        child: Icon(
                          Icons.add,
                          size: 50,
                        ),
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
