import 'package:flutter/material.dart';

import '../../../domain/repository/auth_repository.dart';

class LoginScreenProvider extends ChangeNotifier {
  final AuthRepository _repository;

  LoginScreenProvider(this._repository);

  bool _isObscure = true;
  bool get isObscure => _isObscure;

  void toggleObscure() {
    _isObscure = !_isObscure;
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