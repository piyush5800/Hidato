import 'dart:collection';

import 'package:flutter/cupertino.dart';

class Puzzles {
  List<Set<int>> _puzzles_19 = [
    {17, 14, 19, 1, 3, 9, 7},
  ];

  List<List<int>> _solutions_19 = [
    [13, 12, 11, 10, 14, 19, 3, 5, 6, 7, 8, 9, 15, 16, 17, 18, 1, 2, 4],
  ];

  Set<int> getPuzzle_19(int i) {
    return _puzzles_19[i];
  }

  List<int> getSolution_19(int i) {
    return _solutions_19[i];
  }

  SplayTreeSet<int> getBlanks(int i) {
    SplayTreeSet<int> set = SplayTreeSet<int>();
    for (int j in _solutions_19[i]) {
      if (!_puzzles_19[i].contains(j)) {
        set.add(j);
      }
    }
    return set;
  }
}
