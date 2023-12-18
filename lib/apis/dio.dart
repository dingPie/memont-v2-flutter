import 'package:dio/dio.dart';
import 'package:flutter_init/constants/const_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

// P_TODO: BASE URL env에서 받아와야 함, 임시설정
const String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev/';

final class DioIn {
  DioIn() {
    init();
  }

  static final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    contentType: Headers.jsonContentType,
    // headers: {
    //   HttpHeaders.accessControlAllowOriginHeader: '*',
    // },
  );

  static final _instance = Dio(options);

  late final SharedPreferences _prefs;

  Dio get dio => _instance;

  void init() async {
    _prefs = await SharedPreferences.getInstance();

    _instance.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          // P_TODO: enum (상수) key로 바꿔야 함.
          final String? token = _prefs.getString(ConstKey.token);

          options.headers['Authorization'] = 'Bearer $token';
          print('header 확인: ${options.headers['Authorization']}');
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
