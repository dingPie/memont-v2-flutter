import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:memont_v2/apis/refresh.dart';
import 'package:memont_v2/constants/api_code.dart';

import 'package:memont_v2/global_state/singleton_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// P_MEMO: singletone 패턴이 적용되지 않은 dio. 나중에 한번 따져보자.

final class DioIn {
  SingletonStorage storage = SingletonStorage();
  DioIn() {
    init();
  }

  late Dio _instance;

  Dio get dio => _instance;

  void init() async {
    print('DIO LEGACY INIT');
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

    _instance.interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) async {
          final String? token = storage.accessToken; // P_MEMO: 일반 static 토큰 사용
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
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
