// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentDto _$ContentDtoFromJson(Map<String, dynamic> json) {
  return _ContentDto.fromJson(json);
}

/// @nodoc
mixin _$ContentDto {
  int? get id => throw _privateConstructorUsedError;
  String? get contentType => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  bool get isToBeDeleted => throw _privateConstructorUsedError;
  bool get pinned => throw _privateConstructorUsedError;
  String? get tagName => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  int? get tagId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentDtoCopyWith<ContentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentDtoCopyWith<$Res> {
  factory $ContentDtoCopyWith(
          ContentDto value, $Res Function(ContentDto) then) =
      _$ContentDtoCopyWithImpl<$Res, ContentDto>;
  @useResult
  $Res call(
      {int? id,
      String? contentType,
      String content,
      bool isToBeDeleted,
      bool pinned,
      String? tagName,
      int? userId,
      int? tagId});
}

/// @nodoc
class _$ContentDtoCopyWithImpl<$Res, $Val extends ContentDto>
    implements $ContentDtoCopyWith<$Res> {
  _$ContentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? contentType = freezed,
    Object? content = null,
    Object? isToBeDeleted = null,
    Object? pinned = null,
    Object? tagName = freezed,
    Object? userId = freezed,
    Object? tagId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isToBeDeleted: null == isToBeDeleted
          ? _value.isToBeDeleted
          : isToBeDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      pinned: null == pinned
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      tagName: freezed == tagName
          ? _value.tagName
          : tagName // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      tagId: freezed == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentDtoImplCopyWith<$Res>
    implements $ContentDtoCopyWith<$Res> {
  factory _$$ContentDtoImplCopyWith(
          _$ContentDtoImpl value, $Res Function(_$ContentDtoImpl) then) =
      __$$ContentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? contentType,
      String content,
      bool isToBeDeleted,
      bool pinned,
      String? tagName,
      int? userId,
      int? tagId});
}

/// @nodoc
class __$$ContentDtoImplCopyWithImpl<$Res>
    extends _$ContentDtoCopyWithImpl<$Res, _$ContentDtoImpl>
    implements _$$ContentDtoImplCopyWith<$Res> {
  __$$ContentDtoImplCopyWithImpl(
      _$ContentDtoImpl _value, $Res Function(_$ContentDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? contentType = freezed,
    Object? content = null,
    Object? isToBeDeleted = null,
    Object? pinned = null,
    Object? tagName = freezed,
    Object? userId = freezed,
    Object? tagId = freezed,
  }) {
    return _then(_$ContentDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isToBeDeleted: null == isToBeDeleted
          ? _value.isToBeDeleted
          : isToBeDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      pinned: null == pinned
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      tagName: freezed == tagName
          ? _value.tagName
          : tagName // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      tagId: freezed == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentDtoImpl extends _ContentDto {
  _$ContentDtoImpl(
      {this.id,
      this.contentType,
      required this.content,
      required this.isToBeDeleted,
      required this.pinned,
      this.tagName,
      this.userId,
      this.tagId})
      : super._();

  factory _$ContentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentDtoImplFromJson(json);

  @override
  final int? id;
  @override
  final String? contentType;
  @override
  final String content;
  @override
  final bool isToBeDeleted;
  @override
  final bool pinned;
  @override
  final String? tagName;
  @override
  final int? userId;
  @override
  final int? tagId;

  @override
  String toString() {
    return 'ContentDto(id: $id, contentType: $contentType, content: $content, isToBeDeleted: $isToBeDeleted, pinned: $pinned, tagName: $tagName, userId: $userId, tagId: $tagId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isToBeDeleted, isToBeDeleted) ||
                other.isToBeDeleted == isToBeDeleted) &&
            (identical(other.pinned, pinned) || other.pinned == pinned) &&
            (identical(other.tagName, tagName) || other.tagName == tagName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.tagId, tagId) || other.tagId == tagId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, contentType, content,
      isToBeDeleted, pinned, tagName, userId, tagId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentDtoImplCopyWith<_$ContentDtoImpl> get copyWith =>
      __$$ContentDtoImplCopyWithImpl<_$ContentDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentDtoImplToJson(
      this,
    );
  }
}

abstract class _ContentDto extends ContentDto {
  factory _ContentDto(
      {final int? id,
      final String? contentType,
      required final String content,
      required final bool isToBeDeleted,
      required final bool pinned,
      final String? tagName,
      final int? userId,
      final int? tagId}) = _$ContentDtoImpl;
  _ContentDto._() : super._();

  factory _ContentDto.fromJson(Map<String, dynamic> json) =
      _$ContentDtoImpl.fromJson;

  @override
  int? get id;
  @override
  String? get contentType;
  @override
  String get content;
  @override
  bool get isToBeDeleted;
  @override
  bool get pinned;
  @override
  String? get tagName;
  @override
  int? get userId;
  @override
  int? get tagId;
  @override
  @JsonKey(ignore: true)
  _$$ContentDtoImplCopyWith<_$ContentDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
