import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';
part 'token.g.dart';

// P_TODO: 샘플 코드입니다.
@freezed
class Token with _$Token {
  // constructor 및 본인을 반환하는 factory를 만들어주는 기본 문법
  factory Token({
    required String accessToken,
    required String refreshToken,
  }) = _Token;

  // json 확장
  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  // 메소드나 custom getter 작성시 필수로 추가, 새로 build 해야 함.
  Token._();
}
