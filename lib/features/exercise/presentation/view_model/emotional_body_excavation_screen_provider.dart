import 'package:flutter/material.dart';
class EmotionalBodyExcavationScreenProvider extends ChangeNotifier {
  int _completedSteps = 0;
  int get completedSteps => _completedSteps;

  void incrementCompletedSteps() {
    _completedSteps++;
    notifyListeners();
  }

  int _completedDig = 0;
  int get completedDig => _completedDig;

  void incrementCompletedDigs() {
    _completedDig++;
    if(_completedDig > 2) {
      _completedDig = 2;
    }
    _completedSteps = 0;
    notifyListeners();
  }

  String _selectedOption = "Fear";
  String get selectedOption => _selectedOption;

  void setSelectedOption(String option) {
    _selectedOption = option;
    debugPrint('---Selected Option : $_selectedOption---');
    notifyListeners();
  }
}