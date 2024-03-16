// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_setting_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSettingDtoImpl _$$UserSettingDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserSettingDtoImpl(
      deleteHour: json['deleteHour'] as int?,
      isAlert: json['isAlert'] as bool?,
      isToBeDeletedDefault: json['isToBeDeletedDefault'] as bool?,
    );

Map<String, dynamic> _$$UserSettingDtoImplToJson(
        _$UserSettingDtoImpl instance) =>
    <String, dynamic>{
      'deleteHour': instance.deleteHour,
      'isAlert': instance.isAlert,
      'isToBeDeletedDefault': instance.isToBeDeletedDefault,
    };
