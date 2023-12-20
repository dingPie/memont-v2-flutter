// 일단 에러가 난 시점에서 실행되지 못한 api들 쌓아놔야 하고
// 리프레시 토큰 가져와서 리프레시 살행
// 그리고 남은 api 들 털어주기

import 'package:dio/dio.dart';
import 'package:flutter_init/apis/dio.dart';
import 'package:flutter_init/constants/const_key.dart';
import 'package:flutter_init/providers/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef RequestType = void Function(String accessToken);

final class Refresh {
  bool isRefreshing =
      false; // 토큰 만료로 error 가 여러번 나도 refresh token 발급은 한번만 이뤄주기 위한 상태
  List<RequestType> retryApiList = []; // 현재 error 상태의 api callback 목록함수,
  // late final SharedPreferences _prefs;
  late Dio dioIn;

  void init() async {
    dioIn = DioIn().dio;
    // _prefs = await SharedPreferences.getInstance(); // init으로 빼나?
  }

  Refresh() {
    init();
  }

  Future<String?> refreshToken() async {
    // final String? token = _prefs.getString(ConstKey.accessToken);
    var token = Storage.accessToken;
    try {
      if (token == null) {
        throw Error(); //  not found refresh token
      }
      var result = await Dio().get(
        '토큰 리프레시 URL',
        // options: {}, // 추가할 옵션 넣어주기
      );
      Storage.accessToken = 'result에서 가져온 데이터 세팅';
      // _prefs.setString(
      //   ConstKey.accessToken,
      //   'result에서 가져온 데이터 세팅',
      // );
      return result.data; // P_TODO: 반환받은 데이터 넣어주기
    } catch (err) {
      print('token refreshing error: ${err.toString()} ');
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
        // P_TODO; await Future.wait(); 해야되나?

        // 3. 이번에 실행한 목록 비워줌
        retryApiList = [];
      }
    } catch (err) {
      print('refresh 중 에러222 ${err.toString()}');
      rethrow;
    } finally {
      isRefreshing = false;
    }
  }

  // P_TODO: 여기서 뭐 리턴해줘야함 ?
}
