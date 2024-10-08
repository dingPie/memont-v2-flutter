// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_content_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetContentDto _$GetContentDtoFromJson(Map<String, dynamic> json) {
  return _GetContentDto.fromJson(json);
}

/// @nodoc
mixin _$GetContentDto {
  int? get cursor => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  int? get tagId => throw _privateConstructorUsedError;
  String? get sort => throw _privateConstructorUsedError;
  bool? get isToBeDeleted => throw _privateConstructorUsedError;
  bool? get isNotTagged => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetContentDtoCopyWith<GetContentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetContentDtoCopyWith<$Res> {
  factory $GetContentDtoCopyWith(
          GetContentDto value, $Res Function(GetContentDto) then) =
      _$GetContentDtoCopyWithImpl<$Res, GetContentDto>;
  @useResult
  $Res call(
      {int? cursor,
      int? limit,
      int? tagId,
      String? sort,
      bool? isToBeDeleted,
      bool? isNotTagged});
}

/// @nodoc
class _$GetContentDtoCopyWithImpl<$Res, $Val extends GetContentDto>
    implements $GetContentDtoCopyWith<$Res> {
  _$GetContentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cursor = freezed,
    Object? limit = freezed,
    Object? tagId = freezed,
    Object? sort = freezed,
    Object? isToBeDeleted = freezed,
    Object? isNotTagged = freezed,
  }) {
    return _then(_value.copyWith(
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      tagId: freezed == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
      isToBeDeleted: freezed == isToBeDeleted
          ? _value.isToBeDeleted
          : isToBeDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNotTagged: freezed == isNotTagged
          ? _value.isNotTagged
          : isNotTagged // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetContentDtoImplCopyWith<$Res>
    implements $GetContentDtoCopyWith<$Res> {
  factory _$$GetContentDtoImplCopyWith(
          _$GetContentDtoImpl value, $Res Function(_$GetContentDtoImpl) then) =
      __$$GetContentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cursor,
      int? limit,
      int? tagId,
      String? sort,
      bool? isToBeDeleted,
      bool? isNotTagged});
}

/// @nodoc
class __$$GetContentDtoImplCopyWithImpl<$Res>
    extends _$GetContentDtoCopyWithImpl<$Res, _$GetContentDtoImpl>
    implements _$$GetContentDtoImplCopyWith<$Res> {
  __$$GetContentDtoImplCopyWithImpl(
      _$GetContentDtoImpl _value, $Res Function(_$GetContentDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cursor = freezed,
    Object? limit = freezed,
    Object? tagId = freezed,
    Object? sort = freezed,
    Object? isToBeDeleted = freezed,
    Object? isNotTagged = freezed,
  }) {
    return _then(_$GetContentDtoImpl(
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      tagId: freezed == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
      isToBeDeleted: freezed == isToBeDeleted
          ? _value.isToBeDeleted
          : isToBeDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNotTagged: freezed == isNotTagged
          ? _value.isNotTagged
          : isNotTagged // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetContentDtoImpl extends _GetContentDto {
  _$GetContentDtoImpl(
      {this.cursor,
      this.limit,
      this.tagId,
      this.sort,
      this.isToBeDeleted,
      this.isNotTagged})
      : super._();

  factory _$GetContentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetContentDtoImplFromJson(json);

  @override
  final int? cursor;
  @override
  final int? limit;
  @override
  final int? tagId;
  @override
  final String? sort;
  @override
  final bool? isToBeDeleted;
  @override
  final bool? isNotTagged;

  @override
  String toString() {
    return 'GetContentDto(cursor: $cursor, limit: $limit, tagId: $tagId, sort: $sort, isToBeDeleted: $isToBeDeleted, isNotTagged: $isNotTagged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetContentDtoImpl &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.tagId, tagId) || other.tagId == tagId) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.isToBeDeleted, isToBeDeleted) ||
                other.isToBeDeleted == isToBeDeleted) &&
            (identical(other.isNotTagged, isNotTagged) ||
                other.isNotTagged == isNotTagged));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, cursor, limit, tagId, sort, isToBeDeleted, isNotTagged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetContentDtoImplCopyWith<_$GetContentDtoImpl> get copyWith =>
      __$$GetContentDtoImplCopyWithImpl<_$GetContentDtoImpl>(this, _$identity);

  // P_MEMO null 삭제 로직 추가, 테스트 전이라 이전로직 삭제하지 않음.
  @override
  Map<String, dynamic> toJson() {
    var result = _$$GetContentDtoImplToJson(
      this,
    );
    result.removeWhere((key, value) => value == null);
    return result;
  }
}

abstract class _GetContentDto extends GetContentDto {
  factory _GetContentDto(
      {final int? cursor,
      final int? limit,
      final int? tagId,
      final String? sort,
      final bool? isToBeDeleted,
      final bool? isNotTagged}) = _$GetContentDtoImpl;
  _GetContentDto._() : super._();

  factory _GetContentDto.fromJson(Map<String, dynamic> json) =
      _$GetContentDtoImpl.fromJson;

  @override
  int? get cursor;
  @override
  int? get limit;
  @override
  int? get tagId;
  @override
  String? get sort;
  @override
  bool? get isToBeDeleted;
  @override
  bool? get isNotTagged;
  @override
  @JsonKey(ignore: true)
  _$$GetContentDtoImplCopyWith<_$GetContentDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
