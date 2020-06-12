import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hidato/components/hex_grid.dart';
import 'package:provider/provider.dart';
import 'package:hidato/data/current_data.dart';
import 'package:hidato/components/play_screen_bottom_button.dart';
import 'package:hidato/components/play_screen_counter_icon.dart';

class PuzzleScreen extends StatefulWidget {
  @override
  _PuzzleScreenState createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Level Indicator
            IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Level ${Provider.of<CurrentData>(context).getLevel() + 1}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            //Grid Container
            Expanded(
              flex: 8,
              child: Center(
                child: HexGridWidgetExample(),
              ),
            ),
            //Current Number Counter
            IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    PlayScreenCounterIcon(
                      iconData: Icons.remove,
                      onTap: () {
                        Provider.of<CurrentData>(context, listen: false)
                            .getPreviousNumber();
                      },
                    ),
                    Container(
                      child: Text(
                        "${Provider.of<CurrentData>(context).getCurrentNumber() != 19 ? Provider.of<CurrentData>(context).getCurrentNumber() : ''}",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    PlayScreenCounterIcon(
                      iconData: Icons.add,
                      onTap: () {
                        Provider.of<CurrentData>(context, listen: false)
                            .getNextNumber();
                      },
                    ),
                  ],
                ),
              ),
            ),
            //Solution and Next Puzzle Buttons
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  PlayScreenBottomButton(
                    title: "Solution",
                    onPressed: () {
                      print("Button Pressed");
                    },
                  ),
                  PlayScreenBottomButton(
                    title: "Reset",
                    onPressed: () {
                      print("Button Pressed");
                    },
                  ),
                  PlayScreenBottomButton(
                    title: "Next Puzzle",
                    onPressed: () {
                      print("Button Pressed");
                    },
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
