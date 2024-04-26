import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:memont_v2/models/user_setting_dto/user_setting_dto.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  // constructor 및 본인을 반환하는 factory를 만들어주는 기본 문법
  factory UserDto({
    int? id,
    required String provider,
    required String loginId,
    required String userName,
    required String fcmToken,
    UserSettingDto? userSetting,
  }) = _UserDto;

  // json 확장
  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  // 메소드나 custom getter 작성시 필수로 추가, 새로 build 해야 함.
  UserDto._();
}
