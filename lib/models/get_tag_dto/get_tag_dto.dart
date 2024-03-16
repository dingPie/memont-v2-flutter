import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_tag_dto.freezed.dart';
part 'get_tag_dto.g.dart';

@freezed
class GetTagDto with _$GetTagDto {
  // constructor 및 본인을 반환하는 factory를 만들어주는 기본 문법
  factory GetTagDto({
    int? cursor,
    int? limit,
  }) = _GetTagDto;

  // json 확장
  factory GetTagDto.fromJson(Map<String, dynamic> json) =>
      _$GetTagDtoFromJson(json);

  // 메소드나 custom getter 작성시 필수로 추가, 새로 build 해야 함.
  GetTagDto._();
}
