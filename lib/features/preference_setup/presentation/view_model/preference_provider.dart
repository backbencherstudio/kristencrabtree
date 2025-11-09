import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kristencrabtree/features/preference_setup/domain/repository/preferences_repository.dart';

class PreferenceProvider extends ChangeNotifier {
  final PreferencesRepository _repository;

  PreferenceProvider(this._repository);

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void incIndex() {
    _selectedIndex++;
    debugPrint('--- selectedIndex: $_selectedIndex');
    notifyListeners();
  }

  void resetIndex() {
    _selectedIndex = 0;
    debugPrint('--- selectedIndex: $_selectedIndex');
    notifyListeners();
  }

  String _pref1 = 'Mental Body';
  String _pref2 = 'Mental Body';
  List<String> _pref3 = [];
  String _pref4 = ''; // will store all frequencies in JSON format

  String get pref1 => _pref1;
  String get pref2 => _pref2;
  List<String> get pref3 => _pref3;
  String get pref4 => _pref4;

  void setPref1(String value) {
    _pref1 = value;
    debugPrint('--- pref1: $_pref1');
    notifyListeners();
  }

  void setPref2(String value) {
    _pref2 = value;
    debugPrint('--- pref2: $_pref2');
    notifyListeners();
  }

  void setPref4(String value) {
    _pref4 = value;
    debugPrint('--- pref4: $_pref4');
    notifyListeners();
  }

  void togglePref3(String value) {
    if (_pref3.contains(value)) {
      _pref3.remove(value);
    } else {
      _pref3.add(value);
    }
    debugPrint('--- pref3: $_pref3');
    notifyListeners();
  }

  void clearPref3() {
    _pref3.clear();
    notifyListeners();
  }

  int _focusSelectedIndex = 0;
  int get focusSelectedIndex => _focusSelectedIndex;

  void setFocusIndex(int value) {
    _focusSelectedIndex = value;
    notifyListeners();
  }

  int _exerciseSelectedIndex = 0;
  int get exerciseSelectedIndex => _exerciseSelectedIndex;

  void setExerciseIndex(int value) {
    _exerciseSelectedIndex = value;
    notifyListeners();
  }

  final Map<String, String> _frequencies = {
    'Daily Wisdom Quotes': 'Daily',
    'Guided Exercises': 'Daily',
    'Meditation Content': 'Daily',
    'Community Discussions': 'Daily',
    'Journal Prompts': 'Daily',
    'Scientific Insights': 'Daily',
  };

  Map<String, String> get frequencies => _frequencies;

  void setFrequency(String title, String value) {
    _frequencies[title] = value;

    _pref4 = jsonEncode(_frequencies);
    debugPrint('--- pref4 (frequencies JSON): $_pref4');

    notifyListeners();
  }

  String? getFrequency(String title) {
    return _frequencies[title];
  }
}
