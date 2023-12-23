import 'package:flutter/material.dart';
import 'package:flutter_init/providers/storage.dart';

class User extends ChangeNotifier {
  String _uid = '';
  String _accessToken = '';
  String get uid => _uid;
  String get accessToken => _accessToken;
  bool get isLogin => _uid.isNotEmpty;

// P_TODO: 임시값. 나중에 객체 자체를 넘기거나 named 인자로
  void login({String? uid, String? accessToken}) {
    if (uid == null || accessToken == null) return;
    _uid = uid;
    _accessToken = accessToken;
    Storage.accessToken = accessToken;
    notifyListeners();
  }

  void logout() {
    _uid = '';
    notifyListeners();
  }
}
