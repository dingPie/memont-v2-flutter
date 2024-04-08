import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_tag_dto.freezed.dart';
part 'delete_tag_dto.g.dart';

// P_TODO: 샘플 코드입니다.
@freezed
class DeleteTagDto with _$DeleteTagDto {
  // constructor 및 본인을 반환하는 factory를 만들어주는 기본 문법
  factory DeleteTagDto({
    required double id,
    bool? isDeleteWithContent,
    bool? isToBeDeleted,
  }) = _DeleteTagDto;

  // json 확장
  factory DeleteTagDto.fromJson(Map<String, dynamic> json) =>
      _$DeleteTagDtoFromJson(json);

  // 메소드나 custom getter 작성시 필수로 추가, 새로 build 해야 함.
  DeleteTagDto._();
}
