import 'package:memont_v2/apis/dio.dart';
import 'package:memont_v2/models/login_dto/login_dto.dart';

import 'package:memont_v2/models/token/token.dart';

class AuthApi {
  static final dio = DioIn().dio;

  static Future<Token?> login(LoginDto body) async {
    try {
      final res = await dio.post(
        '/auth/login',
        data: body.toJson(),
      );
      final dynamic responseData = res.data['result']['data'];

      return Token.fromJson(responseData);
    } catch (err) {
      print('login 에러: ${err.toString()}');
      return null;
    }
  }
}
