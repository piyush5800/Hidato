import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:hidato/data/current_data.dart';
import 'package:hidato/components/play_screen_bottom_button.dart';
import 'package:hidato/components/play_screen_counter_icon.dart';
import 'package:hidato/components/hex_grid_solution.dart';

class SolutionScreen extends StatefulWidget {
  @override
  _SolutionScreenState createState() => _SolutionScreenState();
}

class _SolutionScreenState extends State<SolutionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context, -1);
                  },
                  iconSize: 40,
                ),
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    Navigator.pop(
                      context,
                      Provider.of<CurrentData>(context, listen: false)
                          .getLevel(),
                    );
                  },
                  iconSize: 40,
                ),
              ],
            ),
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
            Center(
              child: Container(
                child: Text(
                  "SOLUTION",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Center(
                child: HexGridSolutionWidget(),
              ),
            ),
            Opacity(
              opacity: 0.0,
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      PlayScreenCounterIcon(
                        iconData: Icons.remove,
                        onTap: null,
                      ),
                      Container(
                        child: Text(
                          "${Provider.of<CurrentData>(context).getCurrentNumber() != 19 ? Provider.of<CurrentData>(context).getCurrentNumber() : ''}",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      PlayScreenCounterIcon(
                        iconData: Icons.add,
                        onTap: null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  PlayScreenBottomButton(
                    title: "Next Level",
                    onPressed: () {
                      Navigator.pop(
                        context,
                        Provider.of<CurrentData>(context, listen: false)
                                .getLevel() +
                            1,
                      );
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
