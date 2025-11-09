import 'package:flutter/material.dart';

class PlanProvider extends ChangeNotifier {
  int _selectedPlanIndex = 0;
  int get selectedPlanIndex => _selectedPlanIndex;

  void selectPlan(int index) {
    _selectedPlanIndex = index;
    debugPrint('--- Selected plan index: $_selectedPlanIndex');
    notifyListeners();
  }

  bool isSelected(int index) => _selectedPlanIndex == index;
}
