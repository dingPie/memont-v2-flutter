import 'package:flutter/material.dart';
import 'package:memont_v2/models/user_dto/user_dto.dart';

class UserInfoProvider extends ChangeNotifier {
  UserDto? _userInfo;

  UserDto? get userInfo => _userInfo;

  set userInfo(UserDto? userInfo) {
    _userInfo = userInfo;
    notifyListeners();
  }

  UserInfoProvider({
    UserDto? userInfo,
  }) : _userInfo = userInfo;
}
