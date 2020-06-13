import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:hidato/data/current_data.dart';
import 'package:hidato/components/play_screen_bottom_button.dart';

class LevelCompleteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context, -1);
                  },
                  iconSize: 40,
                ),
              ],
            ),
            IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Level ${Provider.of<CurrentData>(context).getLevel() + 1}\nCompleted ",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40),
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
