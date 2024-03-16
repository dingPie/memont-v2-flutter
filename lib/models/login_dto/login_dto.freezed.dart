// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) {
  return _LoginDto.fromJson(json);
}

/// @nodoc
mixin _$LoginDto {
  String get loginId => throw _privateConstructorUsedError;
  String get providerUid => throw _privateConstructorUsedError;
  String get fcmToken => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginDtoCopyWith<LoginDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDtoCopyWith<$Res> {
  factory $LoginDtoCopyWith(LoginDto value, $Res Function(LoginDto) then) =
      _$LoginDtoCopyWithImpl<$Res, LoginDto>;
  @useResult
  $Res call(
      {String loginId,
      String providerUid,
      String fcmToken,
      String userName,
      String provider});
}

/// @nodoc
class _$LoginDtoCopyWithImpl<$Res, $Val extends LoginDto>
    implements $LoginDtoCopyWith<$Res> {
  _$LoginDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginId = null,
    Object? providerUid = null,
    Object? fcmToken = null,
    Object? userName = null,
    Object? provider = null,
  }) {
    return _then(_value.copyWith(
      loginId: null == loginId
          ? _value.loginId
          : loginId // ignore: cast_nullable_to_non_nullable
              as String,
      providerUid: null == providerUid
          ? _value.providerUid
          : providerUid // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginDtoImplCopyWith<$Res>
    implements $LoginDtoCopyWith<$Res> {
  factory _$$LoginDtoImplCopyWith(
          _$LoginDtoImpl value, $Res Function(_$LoginDtoImpl) then) =
      __$$LoginDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String loginId,
      String providerUid,
      String fcmToken,
      String userName,
      String provider});
}

/// @nodoc
class __$$LoginDtoImplCopyWithImpl<$Res>
    extends _$LoginDtoCopyWithImpl<$Res, _$LoginDtoImpl>
    implements _$$LoginDtoImplCopyWith<$Res> {
  __$$LoginDtoImplCopyWithImpl(
      _$LoginDtoImpl _value, $Res Function(_$LoginDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginId = null,
    Object? providerUid = null,
    Object? fcmToken = null,
    Object? userName = null,
    Object? provider = null,
  }) {
    return _then(_$LoginDtoImpl(
      loginId: null == loginId
          ? _value.loginId
          : loginId // ignore: cast_nullable_to_non_nullable
              as String,
      providerUid: null == providerUid
          ? _value.providerUid
          : providerUid // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginDtoImpl extends _LoginDto {
  _$LoginDtoImpl(
      {required this.loginId,
      required this.providerUid,
      required this.fcmToken,
      required this.userName,
      required this.provider})
      : super._();

  factory _$LoginDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginDtoImplFromJson(json);

  @override
  final String loginId;
  @override
  final String providerUid;
  @override
  final String fcmToken;
  @override
  final String userName;
  @override
  final String provider;

  @override
  String toString() {
    return 'LoginDto(loginId: $loginId, providerUid: $providerUid, fcmToken: $fcmToken, userName: $userName, provider: $provider)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginDtoImpl &&
            (identical(other.loginId, loginId) || other.loginId == loginId) &&
            (identical(other.providerUid, providerUid) ||
                other.providerUid == providerUid) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.provider, provider) ||
                other.provider == provider));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, loginId, providerUid, fcmToken, userName, provider);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginDtoImplCopyWith<_$LoginDtoImpl> get copyWith =>
      __$$LoginDtoImplCopyWithImpl<_$LoginDtoImpl>(this, _$identity);

  // @override
  // Map<String, dynamic> toJson() {
  //   return _$$LoginDtoImplToJson(
  //     this,
  //   );
  // }

  // P_MEMO null 삭제 로직 추가, 테스트 전이라 이전로직 삭제하지 않음.
  @override
  Map<String, dynamic> toJson() {
    var result = _$$LoginDtoImplToJson(
      this,
    );
    result.removeWhere((key, value) => value == null);
    return result;
  }
}

abstract class _LoginDto extends LoginDto {
  factory _LoginDto(
      {required final String loginId,
      required final String providerUid,
      required final String fcmToken,
      required final String userName,
      required final String provider}) = _$LoginDtoImpl;
  _LoginDto._() : super._();

  factory _LoginDto.fromJson(Map<String, dynamic> json) =
      _$LoginDtoImpl.fromJson;

  @override
  String get loginId;
  @override
  String get providerUid;
  @override
  String get fcmToken;
  @override
  String get userName;
  @override
  String get provider;
  @override
  @JsonKey(ignore: true)
  _$$LoginDtoImplCopyWith<_$LoginDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
