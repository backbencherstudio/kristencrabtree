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

  String _selectedOption1 = "Fear";
  String get selectedOption1 => _selectedOption1;

  void setSelectedOption1(String option) {
    _selectedOption1 = option;
    debugPrint('---Selected Option : $_selectedOption1---');
    notifyListeners();
  }

  String _selectedOption2 = "Reflect on this further";
  String get selectedOption2 => _selectedOption2;

  void setSelectedOption2(String option) {
    _selectedOption2 = option;
    debugPrint('---Selected Option : $_selectedOption2---');
    notifyListeners();
  }
}