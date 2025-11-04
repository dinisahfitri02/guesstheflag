import 'package:flutter/foundation.dart';

class AppStateProvider extends ChangeNotifier {
  String playerName = '';
  int totalQuestions = 0;
  int correct = 0;
  int wrong = 0;

  void setPlayer(String name, int total) {
    playerName = name;
    totalQuestions = total;
    correct = 0;
    wrong = 0;
    notifyListeners();
  }

  void addCorrect() {
    correct++;
    notifyListeners();
  }

  void addWrong() {
    wrong++;
    notifyListeners();
  }

  void reset() {
    playerName = '';
    totalQuestions = 0;
    correct = 0;
    wrong = 0;
    notifyListeners();
  }
}
