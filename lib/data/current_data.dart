import 'package:flutter/cupertino.dart';
import 'package:hidato/data/puzzles.dart';

class CurrentData extends ChangeNotifier {
  int _level;
  Set<int> _puzzle;
  List<int> _solution;
  List<int> _blanks;
  int _currentNumberIndex;
  int _currentNumber;

  //REMOVE WHEN setLevel is enabled
  CurrentData() {
    this._level = 0;
    Puzzles puzzles = Puzzles();
    _puzzle = puzzles.getPuzzle_19(_level);
    _solution = puzzles.getSolution_19(_level);
    _blanks = puzzles.getBlanks(_level);
    _blanks.sort();
    _currentNumberIndex = 0;
    _currentNumber = _blanks.first;
  }
  //Remove above
  void setLevel(int level) {
    this._level = 0;
    Puzzles puzzles = Puzzles();
    _puzzle = puzzles.getPuzzle_19(_level);
    _solution = puzzles.getSolution_19(_level);
    _blanks = puzzles.getBlanks(_level);
    _blanks.sort();
    _currentNumberIndex = 4;
    _currentNumber = _blanks.first;
  }

  Set<int> getPuzzle() {
    return this._puzzle;
  }

  List<int> getSolution() {
    return this._solution;
  }

  List<int> getBlanks() {
    return this._blanks;
  }

  int getLevel() {
    return this._level;
  }

  int getCurrentNumber() {
    return this._currentNumber;
  }

  void getPreviousNumber() {
    if (_currentNumberIndex == 0) {
      _currentNumberIndex = _currentNumberIndex;
    } else {
      _currentNumberIndex = _currentNumberIndex - 1;
    }
    _currentNumber = _blanks[_currentNumberIndex];
    notifyListeners();
  }

  void getNextNumber() {
    if (_currentNumberIndex == _blanks.length - 1) {
      _currentNumberIndex = _currentNumberIndex;
    } else {
      _currentNumberIndex = _currentNumberIndex + 1;
    }
    _currentNumber = _blanks[_currentNumberIndex];
    notifyListeners();
  }
}