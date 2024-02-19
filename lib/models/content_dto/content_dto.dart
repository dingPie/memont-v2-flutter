import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_dto.freezed.dart';
part 'content_dto.g.dart';

// P_TODO: 샘플 코드입니다.
@freezed
class ContentDto with _$ContentDto {
  // constructor 및 본인을 반환하는 factory를 만들어주는 기본 문법
  factory ContentDto({
    int? id,
    String? contentType,
    required String content,
    required bool isToBeDeleted,
    required bool pinned,
    String? tagName,
    int? userId,
    int? tagId,
  }) = _ContentDto;

  // json 확장
  factory ContentDto.fromJson(Map<String, dynamic> json) =>
      _$ContentDtoFromJson(json);

  // 메소드나 custom getter 작성시 필수로 추가, 새로 build 해야 함.
  ContentDto._();
}
