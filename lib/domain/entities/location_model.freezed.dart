// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HR_Location_IDModel _$HR_Location_IDModelFromJson(Map<String, dynamic> json) {
  return _HR_Location_IDModel.fromJson(json);
}

/// @nodoc
mixin _$HR_Location_IDModel {
  int? get id => throw _privateConstructorUsedError;
  String? get identifier => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HR_Location_IDModelCopyWith<HR_Location_IDModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HR_Location_IDModelCopyWith<$Res> {
  factory $HR_Location_IDModelCopyWith(
          HR_Location_IDModel value, $Res Function(HR_Location_IDModel) then) =
      _$HR_Location_IDModelCopyWithImpl<$Res, HR_Location_IDModel>;
  @useResult
  $Res call({int? id, String? identifier});
}

/// @nodoc
class _$HR_Location_IDModelCopyWithImpl<$Res, $Val extends HR_Location_IDModel>
    implements $HR_Location_IDModelCopyWith<$Res> {
  _$HR_Location_IDModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HR_Location_IDModelImplCopyWith<$Res>
    implements $HR_Location_IDModelCopyWith<$Res> {
  factory _$$HR_Location_IDModelImplCopyWith(_$HR_Location_IDModelImpl value,
          $Res Function(_$HR_Location_IDModelImpl) then) =
      __$$HR_Location_IDModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? identifier});
}

/// @nodoc
class __$$HR_Location_IDModelImplCopyWithImpl<$Res>
    extends _$HR_Location_IDModelCopyWithImpl<$Res, _$HR_Location_IDModelImpl>
    implements _$$HR_Location_IDModelImplCopyWith<$Res> {
  __$$HR_Location_IDModelImplCopyWithImpl(_$HR_Location_IDModelImpl _value,
      $Res Function(_$HR_Location_IDModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
  }) {
    return _then(_$HR_Location_IDModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HR_Location_IDModelImpl implements _HR_Location_IDModel {
  const _$HR_Location_IDModelImpl({required this.id, required this.identifier});

  factory _$HR_Location_IDModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HR_Location_IDModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? identifier;

  @override
  String toString() {
    return 'HR_Location_IDModel(id: $id, identifier: $identifier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HR_Location_IDModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, identifier);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HR_Location_IDModelImplCopyWith<_$HR_Location_IDModelImpl> get copyWith =>
      __$$HR_Location_IDModelImplCopyWithImpl<_$HR_Location_IDModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HR_Location_IDModelImplToJson(
      this,
    );
  }
}

abstract class _HR_Location_IDModel implements HR_Location_IDModel {
  const factory _HR_Location_IDModel(
      {required final int? id,
      required final String? identifier}) = _$HR_Location_IDModelImpl;

  factory _HR_Location_IDModel.fromJson(Map<String, dynamic> json) =
      _$HR_Location_IDModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get identifier;
  @override
  @JsonKey(ignore: true)
  _$$HR_Location_IDModelImplCopyWith<_$HR_Location_IDModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
