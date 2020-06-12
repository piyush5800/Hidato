import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hidato/components/my_flutter_app_icons.dart';
import 'package:hidato/components/Difficulty.dart';
import 'package:provider/provider.dart';
import 'package:hidato/data/current_data.dart';

DifficultyManage diffManage = DifficultyManage();
int level = 0;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  void increment() {
    setState(() {
      diffManage.nextDiff();
    });
  }

  void decrement() {
    setState(() {
      diffManage.prevDiff();
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(MyFlutterApp.music),
                      iconSize: 30.0,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(MyFlutterApp.speaker),
                      iconSize: 30.0,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(MyFlutterApp.remove_ads),
                  iconSize: 30.0,
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(MyFlutterApp.Hidato),
              iconSize: 250.0,
            ),
            SizedBox(
              height: 10.0,
              width: 150.0,
              child: Divider(
                thickness: 2.0,
                color: Colors.black54,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 25.0),
                  child: IconButton(
                    onPressed: () {
                      decrement();
                    },
                    icon: Icon(Icons.arrow_left),
                    iconSize: 50.0,
                  ),
                ),
                Text(
                  diffManage.getQuestionText(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 25.0),
                  child: IconButton(
                    onPressed: () {
                      increment();
                    },
                    icon: Icon(Icons.arrow_right),
                    iconSize: 50.0,
                  ),
                ),
              ],
            ),
            FlatButton(
              onPressed: () {
                Provider.of<CurrentData>(context, listen: false)
                    .setLevel(level);
                Navigator.pushNamed(context, '/puzzle');
              },
              child: Text('New Game'),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Resume'),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(MyFlutterApp.paint),
              iconSize: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <IconButton>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(MyFlutterApp.gear),
                  iconSize: 30.0,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(MyFlutterApp.information),
                  iconSize: 30.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
