import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexagonal_grid/hexagonal_grid.dart';
import 'package:hexagonal_grid_widget/hex_grid_child.dart';
import 'package:hexagonal_grid_widget/hex_grid_context.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

//This class can contain all the properties you'd like, but it must extends
// HexGridChild and thus implement the toHexWidget and getScaledSized methods.
// The methods provide most fields the HexGridWidget is aware of to allow for
// as much flexibility when building and sizing your HexGridChild widget.
class ExampleHexGridChild extends HexGridChild {
  final int index;

  ExampleHexGridChild(this.index);

  //This is only one example of the customization you can expect from these
  // framework hooks
  @override
  Widget toHexWidget(BuildContext context, HexGridContext hexGridContext,
      double size, UIHex hex) {
    return Container(
        width: size,
        height: size,
        padding: EdgeInsets.all((hexGridContext.maxSize - size) / 2),
        child: getPolygon(context));
  }

  Widget getPolygon(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Button Pressed $index");
      },
      child: ClipPolygon(
        sides: 6,
        borderRadius: 5.0, // Default 0.0 degrees
        //rotate: 90.0, // Default 0.0 degrees
        boxShadows: [
          //PolygonBoxShadow(color: Colors.black, elevation: 1.0),
          //PolygonBoxShadow(color: Colors.grey, elevation: 3.0)
        ],
        child: Container(
          child: Center(
            child: Text(
              index.toString(),
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }

  @override
  double getScaledSize(
      HexGridContext hexGridContext, double distanceFromOrigin) {
    double scaledSize = hexGridContext.maxSize -
        (distanceFromOrigin * hexGridContext.scaleFactor);
    return max(scaledSize, hexGridContext.minSize);
  }
}
