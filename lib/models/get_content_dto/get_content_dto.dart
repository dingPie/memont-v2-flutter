import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_content_dto.freezed.dart';
part 'get_content_dto.g.dart';

@freezed
class GetContentDto with _$GetContentDto {
  // constructor 및 본인을 반환하는 factory를 만들어주는 기본 문법
  factory GetContentDto({
    int? cursor,
    int? limit,
    int? tagId,
    String? sort,
    bool? isToBeDeleted,
    bool? isNotTagged,
  }) = _GetContentDto;

  // json 확장
  factory GetContentDto.fromJson(Map<String, dynamic> json) =>
      _$GetContentDtoFromJson(json);

  // 메소드나 custom getter 작성시 필수로 추가, 새로 build 해야 함.
  GetContentDto._();
}
