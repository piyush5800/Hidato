import 'package:flutter/cupertino.dart';
import 'package:hidato/data/puzzles.dart';

class CurrentData extends ChangeNotifier {
  int _level;
  Set<int> _puzzle;
  List<int> _solution;
  List<int> _blanks;
  int _currentNumberIndex;
  int _currentNumber;
  int _maxSize;

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
    _maxSize = 19;
  }
  //Remove above
  void setLevel(int level) {
    this._level = 0;
    Puzzles puzzles = Puzzles();
    _puzzle = puzzles.getPuzzle_19(_level);
    _solution = puzzles.getSolution_19(_level);
    _blanks = puzzles.getBlanks(_level);
    _blanks.sort();
    _currentNumberIndex = 0;
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

  void removeNumberUponInsertion(int insertedValue) {
    _blanks.remove(insertedValue);
    int i;
    for (i = 0; i < _blanks.length; i++) {
      if (_blanks[i] > insertedValue) {
        break;
      }
    }
    //print("length:${_blanks.length}");
    if (_blanks.length == 0) {
      _currentNumber = _maxSize;
    } else if (_blanks.length != 0 && _currentNumber == 19) {
      _currentNumberIndex = 0;
      _currentNumber = _blanks[_currentNumberIndex];
    } else if (insertedValue == _maxSize - 1) {
      _currentNumberIndex = 0;
      _currentNumber = _blanks[_currentNumberIndex];
    } else {
      _currentNumberIndex = i;
      _currentNumber = _blanks[_currentNumberIndex];
    }
    notifyListeners();
  }

  void insertNumberUponRemoval(int removedValue) {
    if (_currentNumber == 19) {
      _blanks.add(removedValue);
      //print("length:${_blanks.length}");
      _currentNumberIndex = 0;
      _currentNumber = _blanks[_currentNumberIndex];
    } else {
      _blanks.add(removedValue);
      _blanks.sort();
      //print("length:${_blanks.length}");
      _currentNumberIndex = _blanks.indexOf(_currentNumber);
    }

    notifyListeners();
  }
}
