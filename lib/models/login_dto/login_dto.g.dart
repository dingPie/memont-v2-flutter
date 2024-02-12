// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginDtoImpl _$$LoginDtoImplFromJson(Map<String, dynamic> json) =>
    _$LoginDtoImpl(
      loginId: json['loginId'] as String,
      providerUid: json['providerUid'] as String,
      fcmToken: json['fcmToken'] as String,
      userName: json['userName'] as String,
      provider: json['provider'] as String,
    );

Map<String, dynamic> _$$LoginDtoImplToJson(_$LoginDtoImpl instance) =>
    <String, dynamic>{
      'loginId': instance.loginId,
      'providerUid': instance.providerUid,
      'fcmToken': instance.fcmToken,
      'userName': instance.userName,
      'provider': instance.provider,
    };
