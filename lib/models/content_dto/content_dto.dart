import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:memont_v2/models/tag_dto/tag_dto.dart';

part 'content_dto.freezed.dart';
part 'content_dto.g.dart';

@freezed
class ContentDto with _$ContentDto {
  // constructor 및 본인을 반환하는 factory를 만들어주는 기본 문법
  factory ContentDto({
    int? id,
    String? contentType,
    required String content,
    bool? isToBeDeleted,
    bool? pinned,
    String? tagName,
    int? userId,
    int? tagId,
    TagDto? tag,
    String? updatedAt,
  }) = _ContentDto;

  // json 확장
  factory ContentDto.fromJson(Map<String, dynamic> json) =>
      _$ContentDtoFromJson(json);

  // 메소드나 custom getter 작성시 필수로 추가, 새로 build 해야 함.
  ContentDto._();
}
