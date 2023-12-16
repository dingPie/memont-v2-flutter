import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

base class DioIn {
  static final options = BaseOptions(
    baseUrl: 'https://google.com', // P_TODO: BASE URL 밖에서 받아와야 함 .
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    contentType: Headers.jsonContentType,
  );

  static final _instance = Dio(options);

  late final SharedPreferences _prefs;

  // P_TODO: 초기 할당 방법이 이거밖에 없나 ?
  Dio get dio {
    init();
    return _instance;
  }

  void init() async {
    _prefs = await SharedPreferences.getInstance();

    _instance.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          // P_TODO: enum (상수) key로 바꿔야 함.
          final String? token = _prefs?.getString('token');

          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // P_TODO: API로그 찍는 등 소소한 로직들?
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          // P_TODO: 각 에러코드 정의
          // P_TODO: 에러코드별 동작 정의
          // P_TODO: 특히 토큰 만료 및 재발급 로직 필요..

          print('에러확인 ${error.toString()}');

          return handler.next(error);
        },
      ),
    );
  }
}
// P_TODO: static 메서드라 이렇게 사용 가능.
// var test = DioIn().dio;
