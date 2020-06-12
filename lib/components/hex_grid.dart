import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexagonal_grid_widget/hex_grid_child.dart';
import 'package:hexagonal_grid_widget/hex_grid_context.dart';
import 'package:hexagonal_grid_widget/hex_grid_widget.dart';
import 'package:hidato/components/hex_grid_child.dart';
import 'package:hidato/data/current_data.dart';

import 'package:provider/provider.dart';

class HexGridWidgetExample extends StatefulWidget {
  final int level;
  HexGridWidgetExample({this.level});

  @override
  _HexGridWidgetExampleState createState() => _HexGridWidgetExampleState();
}

class _HexGridWidgetExampleState extends State<HexGridWidgetExample> {
  List<HexGridChild> children = [];

  final double _minHexWidgetSize = 90;

  final double _maxHexWidgetSize = 90;

  final double _scaleFactor = 0.2;

  final double _densityFactor = 1.90;

  final double _velocityFactor = 0.0;

  final int _numOfHexGridChildWidgets = 19;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HexGridWidget(
        children: createHexGridChildren(_numOfHexGridChildWidgets),
        hexGridContext: HexGridContext(_minHexWidgetSize, _maxHexWidgetSize,
            _scaleFactor, _densityFactor, _velocityFactor),
      ),
    );
  }

  List<HexGridChild> createHexGridChildren(int numOfChildren) {
//    CurrentData currentData = CurrentData();
//    currentData.setLevel(widget.level);
    Set<int> puzzle = Provider.of<CurrentData>(context).getPuzzle();
    List<int> solution = Provider.of<CurrentData>(context).getSolution();
    for (int i = 0; i < solution.length; i++) {
      children.add(
        ExampleHexGridChild(
          currentValue: puzzle.contains(solution[i]) ? solution[i] : -1,
          isVisible: puzzle.contains(solution[i]),
          onTap: (int index) {
            ExampleHexGridChild current = children[index];
            current.updateCurrentCell(
                Provider.of<CurrentData>(context, listen: false)
                    .getCurrentNumber());
            Provider.of<CurrentData>(context, listen: false).getNextNumber();
            setState(() {
              children[index] = current;
            });
          },
          index: i,
          correctValue: solution[i],
        ),
      );
    }

    return children;
  }
}
