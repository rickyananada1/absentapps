// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

C_BPartner_IDModel _$C_BPartner_IDModelFromJson(Map<String, dynamic> json) {
  return _C_BPartner_IDModel.fromJson(json);
}

/// @nodoc
mixin _$C_BPartner_IDModel {
  int? get id => throw _privateConstructorUsedError;
  String? get identifier => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $C_BPartner_IDModelCopyWith<C_BPartner_IDModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $C_BPartner_IDModelCopyWith<$Res> {
  factory $C_BPartner_IDModelCopyWith(
          C_BPartner_IDModel value, $Res Function(C_BPartner_IDModel) then) =
      _$C_BPartner_IDModelCopyWithImpl<$Res, C_BPartner_IDModel>;
  @useResult
  $Res call({int? id, String? identifier});
}

/// @nodoc
class _$C_BPartner_IDModelCopyWithImpl<$Res, $Val extends C_BPartner_IDModel>
    implements $C_BPartner_IDModelCopyWith<$Res> {
  _$C_BPartner_IDModelCopyWithImpl(this._value, this._then);

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
abstract class _$$C_BPartner_IDModelImplCopyWith<$Res>
    implements $C_BPartner_IDModelCopyWith<$Res> {
  factory _$$C_BPartner_IDModelImplCopyWith(_$C_BPartner_IDModelImpl value,
          $Res Function(_$C_BPartner_IDModelImpl) then) =
      __$$C_BPartner_IDModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? identifier});
}

/// @nodoc
class __$$C_BPartner_IDModelImplCopyWithImpl<$Res>
    extends _$C_BPartner_IDModelCopyWithImpl<$Res, _$C_BPartner_IDModelImpl>
    implements _$$C_BPartner_IDModelImplCopyWith<$Res> {
  __$$C_BPartner_IDModelImplCopyWithImpl(_$C_BPartner_IDModelImpl _value,
      $Res Function(_$C_BPartner_IDModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
  }) {
    return _then(_$C_BPartner_IDModelImpl(
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
class _$C_BPartner_IDModelImpl implements _C_BPartner_IDModel {
  const _$C_BPartner_IDModelImpl({required this.id, required this.identifier});

  factory _$C_BPartner_IDModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$C_BPartner_IDModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? identifier;

  @override
  String toString() {
    return 'C_BPartner_IDModel(id: $id, identifier: $identifier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$C_BPartner_IDModelImpl &&
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
  _$$C_BPartner_IDModelImplCopyWith<_$C_BPartner_IDModelImpl> get copyWith =>
      __$$C_BPartner_IDModelImplCopyWithImpl<_$C_BPartner_IDModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$C_BPartner_IDModelImplToJson(
      this,
    );
  }
}

abstract class _C_BPartner_IDModel implements C_BPartner_IDModel {
  const factory _C_BPartner_IDModel(
      {required final int? id,
      required final String? identifier}) = _$C_BPartner_IDModelImpl;

  factory _C_BPartner_IDModel.fromJson(Map<String, dynamic> json) =
      _$C_BPartner_IDModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get identifier;
  @override
  @JsonKey(ignore: true)
  _$$C_BPartner_IDModelImplCopyWith<_$C_BPartner_IDModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
