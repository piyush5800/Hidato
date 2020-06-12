import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:hidato/data/puzzles.dart';

class CurrentData extends ChangeNotifier {
  int _level;
  Set<int> _puzzle;
  List<int> _solution;
  SplayTreeSet<int> _blanks;
  int currentNumber;

  CurrentData(int level) {
    this._level = level;
    Puzzles puzzles = Puzzles();
    _puzzle = puzzles.getPuzzle_19(_level);
    _solution = puzzles.getSolution_19(_level);
    _blanks = puzzles.getBlanks(_level);
  }

  Set<int> getPuzzle() {
    return this._puzzle;
  }

  List<int> getSolution() {
    return this._solution;
  }

  SplayTreeSet<int> getBlanks() {
    return this._blanks;
  }

  int getLevel() {
    return this._level;
  }
}
