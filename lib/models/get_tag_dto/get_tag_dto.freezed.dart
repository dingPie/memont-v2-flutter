// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_tag_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetTagDto _$GetTagDtoFromJson(Map<String, dynamic> json) {
  return _GetTagDto.fromJson(json);
}

/// @nodoc
mixin _$GetTagDto {
  int? get cursor => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetTagDtoCopyWith<GetTagDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTagDtoCopyWith<$Res> {
  factory $GetTagDtoCopyWith(GetTagDto value, $Res Function(GetTagDto) then) =
      _$GetTagDtoCopyWithImpl<$Res, GetTagDto>;
  @useResult
  $Res call({int? cursor, int? limit});
}

/// @nodoc
class _$GetTagDtoCopyWithImpl<$Res, $Val extends GetTagDto>
    implements $GetTagDtoCopyWith<$Res> {
  _$GetTagDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cursor = freezed, Object? limit = freezed}) {
    return _then(_value.copyWith(
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetTagDtoImplCopyWith<$Res>
    implements $GetTagDtoCopyWith<$Res> {
  factory _$$GetTagDtoImplCopyWith(
          _$GetTagDtoImpl value, $Res Function(_$GetTagDtoImpl) then) =
      __$$GetTagDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? cursor,
    int? limit,
  });
}

/// @nodoc
class __$$GetTagDtoImplCopyWithImpl<$Res>
    extends _$GetTagDtoCopyWithImpl<$Res, _$GetTagDtoImpl>
    implements _$$GetTagDtoImplCopyWith<$Res> {
  __$$GetTagDtoImplCopyWithImpl(
      _$GetTagDtoImpl _value, $Res Function(_$GetTagDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cursor = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$GetTagDtoImpl(
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetTagDtoImpl extends _GetTagDto {
  _$GetTagDtoImpl({this.cursor, this.limit}) : super._();

  factory _$GetTagDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetTagDtoImplFromJson(json);

  @override
  final int? cursor;
  @override
  final int? limit;

  @override
  String toString() {
    return 'GetTagDto(cursor: $cursor, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTagDtoImpl &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
        runtimeType,
        cursor,
        limit,
      );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTagDtoImplCopyWith<_$GetTagDtoImpl> get copyWith =>
      __$$GetTagDtoImplCopyWithImpl<_$GetTagDtoImpl>(this, _$identity);

  // @override
  // Map<String, dynamic> toJson() {
  //   return _$$GetTagDtoImplToJson(
  //     this,
  //   );
  // }

  // P_MEMO null 삭제 로직 추가, 테스트 전이라 이전로직 삭제하지 않음.
  @override
  Map<String, dynamic> toJson() {
    var result = _$$GetTagDtoImplToJson(
      this,
    );
    result.removeWhere((key, value) => value == null);
    return result;
  }
}

abstract class _GetTagDto extends GetTagDto {
  factory _GetTagDto({final int? cursor, final int? limit}) = _$GetTagDtoImpl;
  _GetTagDto._() : super._();

  factory _GetTagDto.fromJson(Map<String, dynamic> json) =
      _$GetTagDtoImpl.fromJson;

  @override
  int? get cursor;
  @override
  int? get limit;
  @override
  @JsonKey(ignore: true)
  _$$GetTagDtoImplCopyWith<_$GetTagDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
