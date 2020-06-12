class Puzzles {
  //Holds the set of numbers which are given at start of game
  List<Set<int>> _puzzles_19 = [
    {17, 14, 19, 1, 3, 9, 7},
    {1, 10, 12, 5, 15, 19},
    {1, 3, 5, 10, 19},
    {19, 5, 1, 2, 13, 9, 15},
  ];

  //Holds the solution of the puzzle in order
  List<List<int>> _solutions_19 = [
    [13, 12, 11, 10, 14, 19, 3, 5, 6, 7, 8, 9, 15, 16, 17, 18, 1, 2, 4],
    [8, 15, 7, 6, 5, 9, 11, 14, 16, 17, 18, 19, 4, 3, 2, 1, 10, 12, 13],
    [10, 7, 8, 9, 11, 2, 4, 19, 18, 17, 16, 15, 14, 13, 12, 1, 3, 5, 6],
    [9, 12, 11, 10, 8, 4, 3, 13, 14, 15, 16, 17, 18, 19, 7, 6, 5, 1, 2],
  ];

  //Use to get puzzle fixed numbers
  Set<int> getPuzzle_19(int i) {
    return _puzzles_19[i];
  }

  //Use to get solution of the puzzle
  List<int> getSolution_19(int i) {
    return _solutions_19[i];
  }

  //Use to get the list of values to be filled in blank spaces
  List<int> getBlanks(int i) {
    List<int> list = [];
    for (int j in _solutions_19[i]) {
      if (!_puzzles_19[i].contains(j)) {
        list.add(j);
      }
    }
    return list;
  }
}
