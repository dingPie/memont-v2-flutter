// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=ldouble
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_tag_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeleteTagDto _$DeleteTagDtoFromJson(Map<String, dynamic> json) {
  return _DeleteTagDto.fromJson(json);
}

/// @nodoc
mixin _$DeleteTagDto {
  double get id => throw _privateConstructorUsedError;
  bool? get isDeleteWithContent => throw _privateConstructorUsedError;
  bool? get isToBeDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteTagDtoCopyWith<DeleteTagDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteTagDtoCopyWith<$Res> {
  factory $DeleteTagDtoCopyWith(
          DeleteTagDto value, $Res Function(DeleteTagDto) then) =
      _$DeleteTagDtoCopyWithImpl<$Res, DeleteTagDto>;
  @useResult
  $Res call({double id, bool? isDeleteWithContent, bool? isToBeDeleted});
}

/// @nodoc
class _$DeleteTagDtoCopyWithImpl<$Res, $Val extends DeleteTagDto>
    implements $DeleteTagDtoCopyWith<$Res> {
  _$DeleteTagDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isDeleteWithContent = freezed,
    Object? isToBeDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as double,
      isDeleteWithContent: freezed == isDeleteWithContent
          ? _value.isDeleteWithContent
          : isDeleteWithContent // ignore: cast_nullable_to_non_nullable
              as bool?,
      isToBeDeleted: freezed == isToBeDeleted
          ? _value.isToBeDeleted
          : isToBeDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteTagDtoImplCopyWith<$Res>
    implements $DeleteTagDtoCopyWith<$Res> {
  factory _$$DeleteTagDtoImplCopyWith(
          _$DeleteTagDtoImpl value, $Res Function(_$DeleteTagDtoImpl) then) =
      __$$DeleteTagDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double id, bool? isDeleteWithContent, bool? isToBeDeleted});
}

/// @nodoc
class __$$DeleteTagDtoImplCopyWithImpl<$Res>
    extends _$DeleteTagDtoCopyWithImpl<$Res, _$DeleteTagDtoImpl>
    implements _$$DeleteTagDtoImplCopyWith<$Res> {
  __$$DeleteTagDtoImplCopyWithImpl(
      _$DeleteTagDtoImpl _value, $Res Function(_$DeleteTagDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isDeleteWithContent = freezed,
    Object? isToBeDeleted = freezed,
  }) {
    return _then(_$DeleteTagDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as double,
      isDeleteWithContent: freezed == isDeleteWithContent
          ? _value.isDeleteWithContent
          : isDeleteWithContent // ignore: cast_nullable_to_non_nullable
              as bool?,
      isToBeDeleted: freezed == isToBeDeleted
          ? _value.isToBeDeleted
          : isToBeDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteTagDtoImpl extends _DeleteTagDto {
  _$DeleteTagDtoImpl(
      {required this.id, this.isDeleteWithContent, this.isToBeDeleted})
      : super._();

  factory _$DeleteTagDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteTagDtoImplFromJson(json);

  @override
  final double id;
  @override
  final bool? isDeleteWithContent;
  @override
  final bool? isToBeDeleted;

  @override
  String toString() {
    return 'DeleteTagDto(id: $id, isDeleteWithContent: $isDeleteWithContent, isToBeDeleted: $isToBeDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteTagDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isDeleteWithContent, isDeleteWithContent) ||
                other.isDeleteWithContent == isDeleteWithContent) &&
            (identical(other.isToBeDeleted, isToBeDeleted) ||
                other.isToBeDeleted == isToBeDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, isDeleteWithContent, isToBeDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteTagDtoImplCopyWith<_$DeleteTagDtoImpl> get copyWith =>
      __$$DeleteTagDtoImplCopyWithImpl<_$DeleteTagDtoImpl>(this, _$identity);

  // P_MEMO null 삭제 로직 추가
  @override
  Map<String, dynamic> toJson() {
    var result = _$$DeleteTagDtoImplToJson(
      this,
    );
    result.removeWhere((key, value) => value == null);
    return result;
  }
}

abstract class _DeleteTagDto extends DeleteTagDto {
  factory _DeleteTagDto(
      {required final double id,
      final bool? isDeleteWithContent,
      final bool? isToBeDeleted}) = _$DeleteTagDtoImpl;
  _DeleteTagDto._() : super._();

  factory _DeleteTagDto.fromJson(Map<String, dynamic> json) =
      _$DeleteTagDtoImpl.fromJson;

  @override
  double get id;
  @override
  bool? get isDeleteWithContent;
  @override
  bool? get isToBeDeleted;
  @override
  @JsonKey(ignore: true)
  _$$DeleteTagDtoImplCopyWith<_$DeleteTagDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
