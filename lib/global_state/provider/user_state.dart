import 'package:flutter/material.dart';
import 'package:memont_v2/global_state/singleton_storage.dart';

class UserState extends ChangeNotifier {
  String _uid = '';

  String get uid => _uid;
  bool get isLogin => _uid.isNotEmpty;

// P_TODO: 임시값. 나중에 객체 자체를 넘기거나 named 인자로
  void login({String? uid, String? accessToken}) {
    if (uid == null || accessToken == null) return;
    _uid = uid;
    var storage = SingletonStorage();
    storage.accessToken = accessToken;
    notifyListeners();
  }

  void logout() {
    _uid = '';
    notifyListeners();
  }
}
