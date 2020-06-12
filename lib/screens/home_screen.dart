import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hidato/components/my_flutter_app_icons.dart';
import 'package:hidato/components/Difficulty.dart';
import 'package:provider/provider.dart';
import 'package:hidato/data/current_data.dart';
import 'package:page_transition/page_transition.dart';
import 'package:hidato/screens/puzzle_screen.dart';

DifficultyManage diffManage = DifficultyManage();
int level = 0;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MyStatefulWidget(),
      ),
    );
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Opacity(
                    opacity: 0.0,
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(MyFlutterApp.music),
                      iconSize: 30.0,
                    ),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(MyFlutterApp.speaker),
                      iconSize: 30.0,
                    ),
                  ),
                ],
              ),
              Opacity(
                opacity: 0.0,
                child: IconButton(
                  onPressed: null,
                  icon: Icon(MyFlutterApp.remove_ads),
                  iconSize: 30.0,
                ),
              ),
            ],
          ),
          Icon(
            MyFlutterApp.Hidato,
            size: 250.0,
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
                padding: const EdgeInsets.only(left: 80.0),
                child: IconButton(
                  onPressed: () {
                    decrement();
                  },
                  icon: Icon(Icons.arrow_left),
                  iconSize: 50.0,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    diffManage.getQuestionText(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 80.0),
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
          OutlineButton(
            child: Text('New Game'),
            shape: StadiumBorder(),
            borderSide: BorderSide(width: 3),
            onPressed: () async {
              //Set the level value to 0 i.e. first level
              Provider.of<CurrentData>(context, listen: false).setLevel(level);
              //get the level screen (level =0 for level 1) and get in return the current level
              var returnedLevel = await Navigator.pushNamed(context, '/puzzle');

              while (returnedLevel != 0) {
                //If the returned level is not zero, get the level of returned level
                level = returnedLevel;
                Provider.of<CurrentData>(context, listen: false)
                    .setLevel(level);
                //push the new level
                returnedLevel = await Navigator.pushNamed(context, '/puzzle');
              }
            },
          ),
          Opacity(
            opacity: 0.0,
            child: OutlineButton(
              onPressed: null,
              child: Text('Resume'),
              shape: StadiumBorder(),
              borderSide: BorderSide(width: 3),
            ),
          ),
          Opacity(
            opacity: 0.0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: IconButton(
                onPressed: null,
                icon: Icon(MyFlutterApp.paint),
                iconSize: 40.0,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Opacity(
                opacity: 0.0,
                child: IconButton(
                  onPressed: null,
                  icon: Icon(MyFlutterApp.gear),
                  iconSize: 30.0,
                ),
              ),
              Opacity(
                opacity: 0.0,
                child: IconButton(
                  onPressed: null,
                  icon: Icon(MyFlutterApp.information),
                  iconSize: 30.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
