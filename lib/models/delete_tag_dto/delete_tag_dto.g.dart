// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_tag_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeleteTagDtoImpl _$$DeleteTagDtoImplFromJson(Map<String, dynamic> json) =>
    _$DeleteTagDtoImpl(
      id: json['id'] as double,
      isDeleteWithContent: json['isDeleteWithContent'] as bool?,
      isToBeDeleted: json['isToBeDeleted'] as bool?,
    );

Map<String, dynamic> _$$DeleteTagDtoImplToJson(_$DeleteTagDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isDeleteWithContent': instance.isDeleteWithContent,
      'isToBeDeleted': instance.isToBeDeleted,
    };
