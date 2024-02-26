// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentDtoImpl _$$ContentDtoImplFromJson(Map<String, dynamic> json) =>
    _$ContentDtoImpl(
      id: json['id'] as int?,
      contentType: json['contentType'] as String?,
      content: json['content'] as String,
      isToBeDeleted: json['isToBeDeleted'] as bool?,
      pinned: json['pinned'] as bool?,
      tagName: json['tagName'] as String?,
      userId: json['userId'] as int?,
      tagId: json['tagId'] as int?,
      tag: json['tag'] == null
          ? null
          : TagDto.fromJson(json['tag'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$ContentDtoImplToJson(_$ContentDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contentType': instance.contentType,
      'content': instance.content,
      'isToBeDeleted': instance.isToBeDeleted,
      'pinned': instance.pinned,
      'tagName': instance.tagName,
      'userId': instance.userId,
      'tagId': instance.tagId,
      'tag': instance.tag?.toJson(),
      'updatedAt': instance.updatedAt,
    };
