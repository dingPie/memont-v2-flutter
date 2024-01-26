import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:memont/apis/dio.dart';

import 'package:memont/providers/storage.dart';

// late final SharedPreferences _prefs; // P_MEMO: accessToken은 그냥 전역으로 사용할 static instance에 추가.

typedef RequestType = void Function(String accessToken);

final class Refresh {
  bool isRefreshing =
      false; // 토큰 만료로 error 가 여러번 나도 refresh token 발급은 한번만 이뤄주기 위한 상태
  List<RequestType> retryApiList = []; // 현재 error 상태의 api callback 목록함수,
  late Dio dioIn;

  void init() async {
    dioIn = DioIn().dio;
  }

  Refresh() {
    init();
  }

  Future<String?> refreshToken() async {
    var token = Storage.accessToken;
    try {
      if (token == null) {
        throw Error(); //  not found refresh token
      }

      String? baseUrl = kReleaseMode
          ? dotenv.env['PROD_API_BASE_URL']
          : Platform.isAndroid
              ? dotenv.env['DEV_ANDROID_API_BASE_URL']
              : dotenv.env['DEV_IOS_API_BASE_URL'];
      var result = await Dio().get(
        '$baseUrl/refresh',
      );
      Storage.accessToken =
          result.data?.access.toString(); // P_MEMO: 반환받은 데이터 저장

      return result.data;
    } catch (err) {
      print('토큰 리프레시 에러: ${err.toString()} ');
      rethrow;
    }
  }

  void refresh(RequestOptions requestOptions) async {
    // 1. 전달받은 dioIn의 요청 정보에 accessToken을 새로 추가 후 배열에 넣어줌
    retryApiList.add((accessToken) {
      requestOptions.headers['Authorization'] = 'Bearer $accessToken';
      dioIn.fetch(requestOptions); // P_TODO: fetch method가 맞나 확인해야 함.
    });

    try {
      if (isRefreshing == false) {
        isRefreshing = true;
        String? token = await refreshToken();
        if (token == null) throw 'err';
        // 2. api 호출 요청을 전부 동기적으로 실행하고
        retryApiList.map((RequestType callback) => callback(token));

        // 3. 이번에 실행한 목록 비워줌 P_TODO; await Future.wait(); 해야되나?
        retryApiList = [];
      }
    } catch (err) {
      print('refresh ERROR: ${err.toString()}');
      rethrow;
    } finally {
      isRefreshing = false;
    }
  }

  // P_TODO: retryApiList 를 return 해줘야 하는지? 실제 refresh 해보면서 확인해야 할듯
}
