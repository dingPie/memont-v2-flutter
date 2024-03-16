// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_content_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetContentDtoImpl _$$GetContentDtoImplFromJson(Map<String, dynamic> json) =>
    _$GetContentDtoImpl(
      cursor: json['cursor'] as int?,
      limit: json['limit'] as int?,
      tagId: json['tagId'] as int?,
    );

Map<String, dynamic> _$$GetContentDtoImplToJson(_$GetContentDtoImpl instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'limit': instance.limit,
      'tagId': instance.tagId,
    };
