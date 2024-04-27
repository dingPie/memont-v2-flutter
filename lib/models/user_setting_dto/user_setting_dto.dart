import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_setting_dto.freezed.dart';
part 'user_setting_dto.g.dart';

@freezed
class UserSettingDto with _$UserSettingDto {
  // constructor 및 본인을 반환하는 factory를 만들어주는 기본 문법
  factory UserSettingDto({
    int? deleteHour,
    bool? isAlert,
    bool? isToBeDeletedDefault,
  }) = _UserSettingDto;

  // json 확장
  factory UserSettingDto.fromJson(Map<String, dynamic> json) =>
      _$UserSettingDtoFromJson(json);

  // 메소드나 custom getter 작성시 필수로 추가, 새로 build 해야 함.
  UserSettingDto._();
}
