// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_setting_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSettingDto _$UserSettingDtoFromJson(Map<String, dynamic> json) {
  return _UserSettingDto.fromJson(json);
}

/// @nodoc
mixin _$UserSettingDto {
  int? get deleteHour => throw _privateConstructorUsedError;
  bool? get isAlert => throw _privateConstructorUsedError;
  bool? get isToBeDeletedDefault => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSettingDtoCopyWith<UserSettingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingDtoCopyWith<$Res> {
  factory $UserSettingDtoCopyWith(
          UserSettingDto value, $Res Function(UserSettingDto) then) =
      _$UserSettingDtoCopyWithImpl<$Res, UserSettingDto>;
  @useResult
  $Res call({int? deleteHour, bool? isAlert, bool? isToBeDeletedDefault});
}

/// @nodoc
class _$UserSettingDtoCopyWithImpl<$Res, $Val extends UserSettingDto>
    implements $UserSettingDtoCopyWith<$Res> {
  _$UserSettingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deleteHour = freezed,
    Object? isAlert = freezed,
    Object? isToBeDeletedDefault = freezed,
  }) {
    return _then(_value.copyWith(
      deleteHour: freezed == deleteHour
          ? _value.deleteHour
          : deleteHour // ignore: cast_nullable_to_non_nullable
              as int?,
      isAlert: freezed == isAlert
          ? _value.isAlert
          : isAlert // ignore: cast_nullable_to_non_nullable
              as bool?,
      isToBeDeletedDefault: freezed == isToBeDeletedDefault
          ? _value.isToBeDeletedDefault
          : isToBeDeletedDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSettingDtoImplCopyWith<$Res>
    implements $UserSettingDtoCopyWith<$Res> {
  factory _$$UserSettingDtoImplCopyWith(_$UserSettingDtoImpl value,
          $Res Function(_$UserSettingDtoImpl) then) =
      __$$UserSettingDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? deleteHour, bool? isAlert, bool? isToBeDeletedDefault});
}

/// @nodoc
class __$$UserSettingDtoImplCopyWithImpl<$Res>
    extends _$UserSettingDtoCopyWithImpl<$Res, _$UserSettingDtoImpl>
    implements _$$UserSettingDtoImplCopyWith<$Res> {
  __$$UserSettingDtoImplCopyWithImpl(
      _$UserSettingDtoImpl _value, $Res Function(_$UserSettingDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deleteHour = freezed,
    Object? isAlert = freezed,
    Object? isToBeDeletedDefault = freezed,
  }) {
    return _then(_$UserSettingDtoImpl(
      deleteHour: freezed == deleteHour
          ? _value.deleteHour
          : deleteHour // ignore: cast_nullable_to_non_nullable
              as int?,
      isAlert: freezed == isAlert
          ? _value.isAlert
          : isAlert // ignore: cast_nullable_to_non_nullable
              as bool?,
      isToBeDeletedDefault: freezed == isToBeDeletedDefault
          ? _value.isToBeDeletedDefault
          : isToBeDeletedDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSettingDtoImpl extends _UserSettingDto {
  _$UserSettingDtoImpl(
      {this.deleteHour, this.isAlert, this.isToBeDeletedDefault})
      : super._();

  factory _$UserSettingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSettingDtoImplFromJson(json);

  @override
  final int? deleteHour;
  @override
  final bool? isAlert;
  @override
  final bool? isToBeDeletedDefault;

  @override
  String toString() {
    return 'UserSettingDto(deleteHour: $deleteHour, isAlert: $isAlert, isToBeDeletedDefault: $isToBeDeletedDefault)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingDtoImpl &&
            (identical(other.deleteHour, deleteHour) ||
                other.deleteHour == deleteHour) &&
            (identical(other.isAlert, isAlert) || other.isAlert == isAlert) &&
            (identical(other.isToBeDeletedDefault, isToBeDeletedDefault) ||
                other.isToBeDeletedDefault == isToBeDeletedDefault));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, deleteHour, isAlert, isToBeDeletedDefault);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingDtoImplCopyWith<_$UserSettingDtoImpl> get copyWith =>
      __$$UserSettingDtoImplCopyWithImpl<_$UserSettingDtoImpl>(
          this, _$identity);

  // @override
  // Map<String, dynamic> toJson() {
  //   return _$$UserSettingDtoImplToJson(
  //     this,
  //   );
  // }

  // P_MEMO null 삭제 로직 추가, 테스트 전이라 이전로직 삭제하지 않음.
  @override
  Map<String, dynamic> toJson() {
    var result = _$$UserSettingDtoImplToJson(
      this,
    );
    result.removeWhere((key, value) => value == null);
    return result;
  }
}

abstract class _UserSettingDto extends UserSettingDto {
  factory _UserSettingDto(
      {final int? deleteHour,
      final bool? isAlert,
      final bool? isToBeDeletedDefault}) = _$UserSettingDtoImpl;
  _UserSettingDto._() : super._();

  factory _UserSettingDto.fromJson(Map<String, dynamic> json) =
      _$UserSettingDtoImpl.fromJson;

  @override
  int? get deleteHour;
  @override
  bool? get isAlert;
  @override
  bool? get isToBeDeletedDefault;
  @override
  @JsonKey(ignore: true)
  _$$UserSettingDtoImplCopyWith<_$UserSettingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
