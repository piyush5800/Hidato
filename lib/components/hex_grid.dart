import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexagonal_grid_widget/hex_grid_child.dart';
import 'package:hexagonal_grid_widget/hex_grid_context.dart';
import 'package:hexagonal_grid_widget/hex_grid_widget.dart';
import 'package:hidato/components/hex_grid_child.dart';

class HexGridWidgetExample extends StatelessWidget {
  final double _minHexWidgetSize = 90;
  final double _maxHexWidgetSize = 90;
  final double _scaleFactor = 0.2;
  final double _densityFactor = 1.90;
  final double _velocityFactor = 0.0;
  final int _numOfHexGridChildWidgets = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Example"),
          centerTitle: true,
        ),
        body: Material(
          type: MaterialType.transparency,
          child: Container(
            color: Colors.white,
            child: HexGridWidget(
                children: createHexGridChildren(_numOfHexGridChildWidgets),
                hexGridContext: HexGridContext(
                    _minHexWidgetSize,
                    _maxHexWidgetSize,
                    _scaleFactor,
                    _densityFactor,
                    _velocityFactor)),
          ),
        ));
  }

  //This would likely be a service (RESTful or DB) that retrieves some data and
  // marshals them into HexGridChild objects
  List<HexGridChild> createHexGridChildren(int numOfChildren) {
    List<HexGridChild> children = [];

    for (int i = 0; i < numOfChildren; i++) {
      children.add(ExampleHexGridChild(i));
    }

    return children;
  }
}
