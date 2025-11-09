import 'package:flutter/material.dart';

import '../../../domain/repository/auth_repository.dart';

class RegisterScreenProvider extends ChangeNotifier {
  final AuthRepository _repository;

  RegisterScreenProvider(this._repository);

  bool _isObscure1 = true;
  bool get isObscure1 => _isObscure1;

  void toggleObscure1() {
    _isObscure1 = !_isObscure1;
    notifyListeners();
  }

  bool _isObscure2 = true;
  bool get isObscure2 => _isObscure2;

  void toggleObscure2() {
    _isObscure2 = !_isObscure2;
    notifyListeners();
  }

  bool _isChecked = true;
  bool get isChecked => _isChecked;

  void toggleCheck(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  bool _isValid = false;
  bool get isValid => _isValid;

  void validate(bool value) {
    _isValid = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
}