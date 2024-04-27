import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_dto.freezed.dart';
part 'login_dto.g.dart';

@freezed
class LoginDto with _$LoginDto {
  // constructor 및 본인을 반환하는 factory를 만들어주는 기본 문법
  factory LoginDto({
    required String loginId,
    required String providerUid,
    required String fcmToken,
    required String userName,
    required String provider,
  }) = _LoginDto;

  // json 확장
  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);

  // 메소드나 custom getter 작성시 필수로 추가, 새로 build 해야 함.
  LoginDto._();
}
