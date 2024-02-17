import 'dart:io';

import 'package:dio/dio.dart';

import 'package:memont_v2/apis/refresh.dart';
import 'package:memont_v2/constants/api_code.dart';

import 'package:memont_v2/global_state/singleton_storage.dart';

import 'package:memont_v2/utils/util_method.dart';

final class DioIn {
  SingletonStorage storage = SingletonStorage();
  late Dio dio;

  DioIn._() {
    print('DIO INIT');

    String baseUrl = UtilMethod.getBaseUrl();

    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 5),
      contentType: Headers.jsonContentType,
      headers: {
        //   HttpHeaders.accessControlAllowOriginHeader: '*',
        HttpHeaders.contentTypeHeader: 'application/json'
      },
    );

    dio = Dio(options);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) async {
          final String? token = storage.accessToken;
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
          int statusCode = error.response?.statusCode ?? 0;
          bool isUnAuthorization = statusCode == API_CODE.UN_AUTHORIZATION;
          bool isExpired = statusCode == API_CODE.EXPIRED_TOKEN;

          // // P_TODO: 에러코드별 동작 정의
          if (isExpired) {
            print('여긴가???????? $statusCode');
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

  static final DioIn _instance = DioIn._();
  factory DioIn() {
    return _instance;
  }
}
