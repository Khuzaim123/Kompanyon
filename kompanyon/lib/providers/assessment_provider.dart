import 'package:flutter/material.dart';

class AssessmentProvider with ChangeNotifier {
  int _questionIndex = 0;
  int get questionIndex => _questionIndex;

  int _selected = 0;
  int get selected => _selected;

  final int totalQuestions = 10;

  void selectOption(int index) {
    _selected = index;
    notifyListeners();
  }

  void nextQuestion() {
    if (_questionIndex < totalQuestions - 1) {
      _questionIndex++;
      _selected = 0;
      notifyListeners();
    }
  }

  void prevQuestion() {
    if (_questionIndex > 0) {
      _questionIndex--;
      _selected = 0;
      notifyListeners();
    }
  }

  void reset() {
    _questionIndex = 0;
    _selected = 0;
    notifyListeners();
  }
} 