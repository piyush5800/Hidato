import 'package:flutter/material.dart';

class PlayScreenBottomButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  PlayScreenBottomButton({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        child: Container(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
