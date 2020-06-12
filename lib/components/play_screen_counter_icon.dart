import 'package:flutter/material.dart';

class PlayScreenCounterIcon extends StatelessWidget {
  final IconData iconData;
  final Function onTap;
  PlayScreenCounterIcon({this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          iconData,
          size: 50,
        ),
      ),
    );
  }
}
