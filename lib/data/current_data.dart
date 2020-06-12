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
    _maxSize = 19;
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
      //Handles the case when the current element is first element
      _currentNumberIndex = _currentNumberIndex;
    } else {
      //Handles all other cases
      _currentNumberIndex = _currentNumberIndex - 1;
    }
    //Updates the value of current number
    _currentNumber = _blanks[_currentNumberIndex];
    notifyListeners();
  }

  void getNextNumber() {
    if (_currentNumberIndex == _blanks.length - 1) {
      //Handles the case when the current element is last element
      _currentNumberIndex = _currentNumberIndex;
    } else {
      //Handles all other cases
      _currentNumberIndex = _currentNumberIndex + 1;
    }
    //Updates the value of current number
    _currentNumber = _blanks[_currentNumberIndex];
    notifyListeners();
  }

  void removeNumberUponInsertion(int insertedValue) {
    //Removes the values inserted into grid from available numbers(_blanks)
    _blanks.remove(insertedValue);

    if (_blanks.length == 0) {
      //Handles the case when all the numbers are inserted
      _currentNumber = _maxSize;
    } else {
      //Handles the case when at least one number is available to insert
      if (insertedValue == _maxSize - 1) {
        //Handles the case where maxSize-1 is inserted
        _currentNumberIndex = 0;
        _currentNumber = _blanks[_currentNumberIndex];
      } else {
        //Finds the next larger value
        int i;
        for (i = 0; i < _blanks.length; i++) {
          if (_blanks[i] > insertedValue) {
            break;
          }
        }
        //Assigns the found number to correct variables
        _currentNumberIndex = i;
        _currentNumber = _blanks[_currentNumberIndex];

        //Case Removed: _blanks.length != 0 && _currentNumber == 19
        //Consequences of case:_currentNumberIndex = 0
        //                     _currentNumber = _blanks[_currentNumberIndex];
      }
    }
    notifyListeners();
  }

  void insertNumberUponRemoval(int removedValue) {
    if (_currentNumber == 19) {
      //Handles the case when all numbers are inserted and one is removed
      _blanks.add(removedValue);
      _currentNumberIndex = 0;
      _currentNumber = _blanks[_currentNumberIndex];
    } else {
      //Handles all other cases
      _blanks.add(removedValue);
      _blanks.sort();
      _currentNumberIndex = _blanks.indexOf(_currentNumber);
    }
    notifyListeners();
  }
}
