import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  // P_TODO: 현재 userName이랑 상태를 공유하긴 하나, 정확한 목적 분리 떄문에 일단 상태도 분리함
  bool _isLoading = false;
  bool _isLogin = false;
  bool _isDeleting = false;

  bool get isLoading => _isLoading;
  bool get isLogin => _isLogin;
  bool get isDeleting => _isDeleting;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set isLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  set isDeleting(bool value) {
    _isDeleting = value;
    notifyListeners();
  }

  AppState({
    required bool isLogin,
    required bool isDeleting,
  })  : _isLogin = isLogin,
        _isDeleting = isDeleting;
}
