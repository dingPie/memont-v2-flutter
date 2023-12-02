import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  var _uid = '';
  String get uid => _uid;
  bool get isLogin => _uid.isNotEmpty;

  void login(String uid) {
    _uid = uid;
    notifyListeners();
  }

  void logout() {
    _uid = '';
    notifyListeners();
  }
}
