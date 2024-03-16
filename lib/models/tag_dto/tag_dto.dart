import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_dto.freezed.dart';
part 'tag_dto.g.dart';

@freezed
class TagDto with _$TagDto {
  // constructor 및 본인을 반환하는 factory를 만들어주는 기본 문법
  factory TagDto({
    int? id,
    required String name,
    String? color,
  }) = _TagDto;

  // json 확장
  factory TagDto.fromJson(Map<String, dynamic> json) => _$TagDtoFromJson(json);

  // 메소드나 custom getter 작성시 필수로 추가, 새로 build 해야 함.
  TagDto._();
}
