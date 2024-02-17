// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'working_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkingLocation _$WorkingLocationFromJson(Map<String, dynamic> json) {
  return _WorkingLocation.fromJson(json);
}

/// @nodoc
mixin _$WorkingLocation {
  int? get id => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  String? get Name => throw _privateConstructorUsedError;
  String? get Latitude => throw _privateConstructorUsedError;
  String? get Longitude => throw _privateConstructorUsedError;
  int? get Radius => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkingLocationCopyWith<WorkingLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkingLocationCopyWith<$Res> {
  factory $WorkingLocationCopyWith(
          WorkingLocation value, $Res Function(WorkingLocation) then) =
      _$WorkingLocationCopyWithImpl<$Res, WorkingLocation>;
  @useResult
  $Res call(
      {int? id,
      String? uid,
      String? Name,
      String? Latitude,
      String? Longitude,
      int? Radius});
}

/// @nodoc
class _$WorkingLocationCopyWithImpl<$Res, $Val extends WorkingLocation>
    implements $WorkingLocationCopyWith<$Res> {
  _$WorkingLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? Name = freezed,
    Object? Latitude = freezed,
    Object? Longitude = freezed,
    Object? Radius = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      Name: freezed == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String?,
      Latitude: freezed == Latitude
          ? _value.Latitude
          : Latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      Longitude: freezed == Longitude
          ? _value.Longitude
          : Longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      Radius: freezed == Radius
          ? _value.Radius
          : Radius // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkingLocationImplCopyWith<$Res>
    implements $WorkingLocationCopyWith<$Res> {
  factory _$$WorkingLocationImplCopyWith(_$WorkingLocationImpl value,
          $Res Function(_$WorkingLocationImpl) then) =
      __$$WorkingLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? uid,
      String? Name,
      String? Latitude,
      String? Longitude,
      int? Radius});
}

/// @nodoc
class __$$WorkingLocationImplCopyWithImpl<$Res>
    extends _$WorkingLocationCopyWithImpl<$Res, _$WorkingLocationImpl>
    implements _$$WorkingLocationImplCopyWith<$Res> {
  __$$WorkingLocationImplCopyWithImpl(
      _$WorkingLocationImpl _value, $Res Function(_$WorkingLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? Name = freezed,
    Object? Latitude = freezed,
    Object? Longitude = freezed,
    Object? Radius = freezed,
  }) {
    return _then(_$WorkingLocationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      Name: freezed == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String?,
      Latitude: freezed == Latitude
          ? _value.Latitude
          : Latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      Longitude: freezed == Longitude
          ? _value.Longitude
          : Longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      Radius: freezed == Radius
          ? _value.Radius
          : Radius // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkingLocationImpl implements _WorkingLocation {
  const _$WorkingLocationImpl(
      {required this.id,
      required this.uid,
      required this.Name,
      required this.Latitude,
      required this.Longitude,
      required this.Radius});

  factory _$WorkingLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkingLocationImplFromJson(json);

  @override
  final int? id;
  @override
  final String? uid;
  @override
  final String? Name;
  @override
  final String? Latitude;
  @override
  final String? Longitude;
  @override
  final int? Radius;

  @override
  String toString() {
    return 'WorkingLocation(id: $id, uid: $uid, Name: $Name, Latitude: $Latitude, Longitude: $Longitude, Radius: $Radius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkingLocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.Name, Name) || other.Name == Name) &&
            (identical(other.Latitude, Latitude) ||
                other.Latitude == Latitude) &&
            (identical(other.Longitude, Longitude) ||
                other.Longitude == Longitude) &&
            (identical(other.Radius, Radius) || other.Radius == Radius));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, uid, Name, Latitude, Longitude, Radius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkingLocationImplCopyWith<_$WorkingLocationImpl> get copyWith =>
      __$$WorkingLocationImplCopyWithImpl<_$WorkingLocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkingLocationImplToJson(
      this,
    );
  }
}

abstract class _WorkingLocation implements WorkingLocation {
  const factory _WorkingLocation(
      {required final int? id,
      required final String? uid,
      required final String? Name,
      required final String? Latitude,
      required final String? Longitude,
      required final int? Radius}) = _$WorkingLocationImpl;

  factory _WorkingLocation.fromJson(Map<String, dynamic> json) =
      _$WorkingLocationImpl.fromJson;

  @override
  int? get id;
  @override
  String? get uid;
  @override
  String? get Name;
  @override
  String? get Latitude;
  @override
  String? get Longitude;
  @override
  int? get Radius;
  @override
  @JsonKey(ignore: true)
  _$$WorkingLocationImplCopyWith<_$WorkingLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
