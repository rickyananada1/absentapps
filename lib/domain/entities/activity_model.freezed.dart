// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return _Activity.fromJson(json);
}

/// @nodoc
mixin _$Activity {
  int? get id => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  DateTime? get DateFinger => throw _privateConstructorUsedError;
  String? get Latitude => throw _privateConstructorUsedError;
  String? get Longitude => throw _privateConstructorUsedError;
  double? get Distance => throw _privateConstructorUsedError;
  FingerTypeModel? get FingerType => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityCopyWith<Activity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityCopyWith<$Res> {
  factory $ActivityCopyWith(Activity value, $Res Function(Activity) then) =
      _$ActivityCopyWithImpl<$Res, Activity>;
  @useResult
  $Res call(
      {int? id,
      String? uid,
      DateTime? DateFinger,
      String? Latitude,
      String? Longitude,
      double? Distance,
      FingerTypeModel? FingerType,
      String? location});

  $FingerTypeModelCopyWith<$Res>? get FingerType;
}

/// @nodoc
class _$ActivityCopyWithImpl<$Res, $Val extends Activity>
    implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? DateFinger = freezed,
    Object? Latitude = freezed,
    Object? Longitude = freezed,
    Object? Distance = freezed,
    Object? FingerType = freezed,
    Object? location = freezed,
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
      DateFinger: freezed == DateFinger
          ? _value.DateFinger
          : DateFinger // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      Latitude: freezed == Latitude
          ? _value.Latitude
          : Latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      Longitude: freezed == Longitude
          ? _value.Longitude
          : Longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      Distance: freezed == Distance
          ? _value.Distance
          : Distance // ignore: cast_nullable_to_non_nullable
              as double?,
      FingerType: freezed == FingerType
          ? _value.FingerType
          : FingerType // ignore: cast_nullable_to_non_nullable
              as FingerTypeModel?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FingerTypeModelCopyWith<$Res>? get FingerType {
    if (_value.FingerType == null) {
      return null;
    }

    return $FingerTypeModelCopyWith<$Res>(_value.FingerType!, (value) {
      return _then(_value.copyWith(FingerType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActivityImplCopyWith<$Res>
    implements $ActivityCopyWith<$Res> {
  factory _$$ActivityImplCopyWith(
          _$ActivityImpl value, $Res Function(_$ActivityImpl) then) =
      __$$ActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? uid,
      DateTime? DateFinger,
      String? Latitude,
      String? Longitude,
      double? Distance,
      FingerTypeModel? FingerType,
      String? location});

  @override
  $FingerTypeModelCopyWith<$Res>? get FingerType;
}

/// @nodoc
class __$$ActivityImplCopyWithImpl<$Res>
    extends _$ActivityCopyWithImpl<$Res, _$ActivityImpl>
    implements _$$ActivityImplCopyWith<$Res> {
  __$$ActivityImplCopyWithImpl(
      _$ActivityImpl _value, $Res Function(_$ActivityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? DateFinger = freezed,
    Object? Latitude = freezed,
    Object? Longitude = freezed,
    Object? Distance = freezed,
    Object? FingerType = freezed,
    Object? location = freezed,
  }) {
    return _then(_$ActivityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      DateFinger: freezed == DateFinger
          ? _value.DateFinger
          : DateFinger // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      Latitude: freezed == Latitude
          ? _value.Latitude
          : Latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      Longitude: freezed == Longitude
          ? _value.Longitude
          : Longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      Distance: freezed == Distance
          ? _value.Distance
          : Distance // ignore: cast_nullable_to_non_nullable
              as double?,
      FingerType: freezed == FingerType
          ? _value.FingerType
          : FingerType // ignore: cast_nullable_to_non_nullable
              as FingerTypeModel?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityImpl implements _Activity {
  const _$ActivityImpl(
      {required this.id,
      required this.uid,
      required this.DateFinger,
      required this.Latitude,
      required this.Longitude,
      required this.Distance,
      required this.FingerType,
      required this.location});

  factory _$ActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? uid;
  @override
  final DateTime? DateFinger;
  @override
  final String? Latitude;
  @override
  final String? Longitude;
  @override
  final double? Distance;
  @override
  final FingerTypeModel? FingerType;
  @override
  final String? location;

  @override
  String toString() {
    return 'Activity(id: $id, uid: $uid, DateFinger: $DateFinger, Latitude: $Latitude, Longitude: $Longitude, Distance: $Distance, FingerType: $FingerType, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.DateFinger, DateFinger) ||
                other.DateFinger == DateFinger) &&
            (identical(other.Latitude, Latitude) ||
                other.Latitude == Latitude) &&
            (identical(other.Longitude, Longitude) ||
                other.Longitude == Longitude) &&
            (identical(other.Distance, Distance) ||
                other.Distance == Distance) &&
            (identical(other.FingerType, FingerType) ||
                other.FingerType == FingerType) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, uid, DateFinger, Latitude,
      Longitude, Distance, FingerType, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityImplCopyWith<_$ActivityImpl> get copyWith =>
      __$$ActivityImplCopyWithImpl<_$ActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityImplToJson(
      this,
    );
  }
}

abstract class _Activity implements Activity {
  const factory _Activity(
      {required final int? id,
      required final String? uid,
      required final DateTime? DateFinger,
      required final String? Latitude,
      required final String? Longitude,
      required final double? Distance,
      required final FingerTypeModel? FingerType,
      required final String? location}) = _$ActivityImpl;

  factory _Activity.fromJson(Map<String, dynamic> json) =
      _$ActivityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get uid;
  @override
  DateTime? get DateFinger;
  @override
  String? get Latitude;
  @override
  String? get Longitude;
  @override
  double? get Distance;
  @override
  FingerTypeModel? get FingerType;
  @override
  String? get location;
  @override
  @JsonKey(ignore: true)
  _$$ActivityImplCopyWith<_$ActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
