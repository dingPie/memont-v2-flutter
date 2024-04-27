import 'package:memont_v2/apis/dio.dart';
import 'package:memont_v2/models/delete_tag_dto/delete_tag_dto.dart';

import 'package:memont_v2/models/user_dto/user_dto.dart';
import 'package:memont_v2/models/user_setting_dto/user_setting_dto.dart';

class UserApi {
  static final dio = DioIn().dio;

  static Future<UserDto?> getMe() async {
    try {
      final res = await dio.get('/user/me');
      final dynamic responseData = res.data['result']['data'];

      UserDto result = UserDto.fromJson(responseData);
      return result;
    } catch (err) {
      print('user 목록 조회 에러: ${err.toString()}');
      return null;
    }
  }

  static void updateSetting(UserSettingDto body) async {
    try {
      final res = await dio.patch(
        '/user/update-setting',
        data: body.toJson(),
      );
      print('res: ${res.toString()}');
    } catch (err) {
      print('유서 설정 변경 에러: ${err.toString()}');
      return null;
    }
  }

  static void withdrawal() async {
    try {
      final res = await dio.delete(
        '/user/withdrawal',
      );
      print('res: ${res.toString()}');
    } catch (err) {
      print('탈퇴 에러: ${err.toString()}');
      return null;
    }
  }
}
