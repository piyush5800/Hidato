class Difficulty {
  String name;
  int level;
  Difficulty(this.name, this.level);
}

class DifficultyManage {
  int _currentDiff = 0;

  List<Difficulty> _difficulty = [
    Difficulty('Beginner', 1),
    Difficulty('Easy', 2),
    Difficulty('Medium', 3),
    Difficulty('Hard', 4),
    Difficulty('Extreme', 5)
  ];

  void nextDiff() {
    if (_currentDiff < _difficulty.length - 1) {
      _currentDiff++;
    }
  }

  void prevDiff() {
    if (_currentDiff > 0) {
      _currentDiff--;
    }
  }

  String getQuestionText() {
    return _difficulty[_currentDiff].name;
  }

  int getCorrectAnswer() {
    return _difficulty[_currentDiff].level;
  }
}
