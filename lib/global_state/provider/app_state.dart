import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  String? userName;
  // P_TODO: 현재 userName이랑 상태를 공유하긴 하나, 정확한 목적 분리 떄문에 일단 상태도 분리함
  bool isLoading = false;
  bool isLogin = false;

  AppState({
    required this.isLogin,
  });
}
