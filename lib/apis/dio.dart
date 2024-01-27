import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:memont/apis/refresh.dart';
import 'package:memont/constants/api_code.dart';

import 'package:memont/providers/storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// P_TODO: 앱이 아닌 웹 환경에선 CORS 에러가 발생함.

final class DioIn {
  DioIn() {
    init();
  }

  late Dio _instance;

  // late final SharedPreferences _prefs; // P_MEMO: static 영역의 token 사용

  Dio get dio => _instance;

  void init() async {
    String? _baseUrl = kReleaseMode
        ? dotenv.env['PROD_API_BASE_URL']
        : Platform.isAndroid
            ? dotenv.env['DEV_ANDROID_API_BASE_URL']
            : dotenv.env['DEV_IOS_API_BASE_URL'];

    BaseOptions options = BaseOptions(
      baseUrl: _baseUrl ?? '',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 5),
      contentType: Headers.jsonContentType,
      headers: {
        //   HttpHeaders.accessControlAllowOriginHeader: '*',
        HttpHeaders.contentTypeHeader: 'application/json'
      },
    );

    _instance = Dio(options);

    print('@@@@@@@@@@@@@@@@@@ ${options.baseUrl}');

    _instance.interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) async {
          final String? token = Storage.accessToken; // P_MEMO: 일반 static 토큰 사용
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          print('header 확인: ${options.uri}');
          return handler.next(options);
        },
        onResponse: (
          Response response,
          ResponseInterceptorHandler handler,
        ) {
          // P_TODO: API로그 찍는 등 소소한 로직들?

          return handler.next(response);
        },
        onError: (
          DioException error,
          ErrorInterceptorHandler handler,
        ) {
          // P_TODO: error log 잘 찍는법 확인
          print('kkkkkkkkkkkkkkkk ${error.message.toString()}');

          int statusCode = error.response?.statusCode ?? 0;
          bool isUnAuthorization = statusCode == API_CODE.UN_AUTHORIZATION;
          bool isExpired = statusCode == API_CODE.EXPIRED_TOKEN;

          // // P_TODO: 에러코드별 동작 정의
          if (isExpired) {
            Refresh().refresh(error.requestOptions);
          }
          if (isUnAuthorization) {
            // P_TODO: 로그아웃처리, 토큰 삭제 등 로직
          }

          return handler.next(error);
        },
      ),
    );
  }
}
