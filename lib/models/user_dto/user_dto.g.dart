// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      id: json['id'] as int?,
      provider: json['provider'] as String,
      loginId: json['loginId'] as String,
      userName: json['userName'] as String,
      fcmToken: json['fcmToken'] as String,
      userSetting: json['userSetting'] == null
          ? null
          : UserSettingDto.fromJson(
              json['userSetting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'provider': instance.provider,
      'loginId': instance.loginId,
      'userName': instance.userName,
      'fcmToken': instance.fcmToken,
      'userSetting': instance.userSetting?.toJson(),
    };
