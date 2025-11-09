import 'package:flutter/material.dart';

import '../../domain/repository/auth_repository.dart';

class ResetPasswordProvider extends ChangeNotifier {
  final AuthRepository _repository;

  ResetPasswordProvider(this._repository);
  String _otp = '';
  String get otp => _otp;

  void setOtp(String newOtp) {
    _otp = newOtp;
    debugPrint("OTP: $_otp");
    notifyListeners();
  }

  void clearOtp() {
    _otp = '';
    notifyListeners();
  }

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
}