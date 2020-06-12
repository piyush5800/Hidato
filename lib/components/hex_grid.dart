import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexagonal_grid_widget/hex_grid_child.dart';
import 'package:hexagonal_grid_widget/hex_grid_context.dart';
import 'package:hexagonal_grid_widget/hex_grid_widget.dart';
import 'package:hidato/components/hex_grid_child.dart';
import 'package:hidato/data/current_data.dart';

import 'package:provider/provider.dart';

//Widget to lay out the entire grid
class HexGridWidgetExample extends StatefulWidget {
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

  //Handler to handle what happens when a click is detected on any cell
  void cellClickHandler(int index) {
    ExampleHexGridChild current = children[index];
    if (current.isPartOfPuzzle == false) {
      //current value in counter: to be inserted into cell
      int insertedValue =
          Provider.of<CurrentData>(context, listen: false).getCurrentNumber();

      //value in cell after insertion, or value before removal
      int returnedValue = current.updateCurrentCell(
          Provider.of<CurrentData>(context, listen: false).getCurrentNumber());

      if (returnedValue == insertedValue) {
        //Case when value is inserted into cell
        Provider.of<CurrentData>(context, listen: false)
            .removeNumberUponInsertion(returnedValue);
      } else {
        //Case when the value is removed from the cell
        Provider.of<CurrentData>(context, listen: false)
            .insertNumberUponRemoval(returnedValue);
      }
      setState(() {
        children[index] = current;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HexGridWidget(
        children: createHexGridChildren(
          _numOfHexGridChildWidgets,
        ),
        hexGridContext: HexGridContext(
          _minHexWidgetSize,
          _maxHexWidgetSize,
          _scaleFactor,
          _densityFactor,
          _velocityFactor,
        ),
      ),
    );
  }

  List<HexGridChild> createHexGridChildren(int numOfChildren) {
    //Get the required data to layout the grid using provider
    Set<int> puzzle = Provider.of<CurrentData>(context).getPuzzle();
    List<int> solution = Provider.of<CurrentData>(context).getSolution();
    //Iterate over all the available elements
    for (int i = 0; i < solution.length; i++) {
      children.add(
        ExampleHexGridChild(
          //If the cell is given, then put correct value, else put -1
          currentValue: puzzle.contains(solution[i]) ? solution[i] : -1,
          //denotes if the cell is given part of puzzle
          isPartOfPuzzle: puzzle.contains(solution[i]),
          //Denotes if the cell is visible or not
          isVisible: puzzle.contains(solution[i]),
          //Denotes the grid index number of cell, also position in children list
          index: i,
          //Denotes the correct answer of the cell
          correctValue: solution[i],
          //Denotes what happens when a tap is detected on the cell
          onTap: (int index) => cellClickHandler(index),
        ),
      );
    }
    return children;
  }
}
