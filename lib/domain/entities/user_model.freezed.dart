// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get username => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get uid => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get NIP => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get EmployeeName => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get DoH => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get Office => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get Department => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get Position => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get model_name => throw _privateConstructorUsedError;
  @HiveField(10)
  List<double>? get embeddings => throw _privateConstructorUsedError;
  @HiveField(11)
  double? get distance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String? username,
      @HiveField(2) String? uid,
      @HiveField(3) String? NIP,
      @HiveField(4) String? EmployeeName,
      @HiveField(5) String? DoH,
      @HiveField(6) String? Office,
      @HiveField(7) String? Department,
      @HiveField(8) String? Position,
      @HiveField(9) String? model_name,
      @HiveField(10) List<double>? embeddings,
      @HiveField(11) double? distance});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? uid = freezed,
    Object? NIP = freezed,
    Object? EmployeeName = freezed,
    Object? DoH = freezed,
    Object? Office = freezed,
    Object? Department = freezed,
    Object? Position = freezed,
    Object? model_name = freezed,
    Object? embeddings = freezed,
    Object? distance = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      NIP: freezed == NIP
          ? _value.NIP
          : NIP // ignore: cast_nullable_to_non_nullable
              as String?,
      EmployeeName: freezed == EmployeeName
          ? _value.EmployeeName
          : EmployeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      DoH: freezed == DoH
          ? _value.DoH
          : DoH // ignore: cast_nullable_to_non_nullable
              as String?,
      Office: freezed == Office
          ? _value.Office
          : Office // ignore: cast_nullable_to_non_nullable
              as String?,
      Department: freezed == Department
          ? _value.Department
          : Department // ignore: cast_nullable_to_non_nullable
              as String?,
      Position: freezed == Position
          ? _value.Position
          : Position // ignore: cast_nullable_to_non_nullable
              as String?,
      model_name: freezed == model_name
          ? _value.model_name
          : model_name // ignore: cast_nullable_to_non_nullable
              as String?,
      embeddings: freezed == embeddings
          ? _value.embeddings
          : embeddings // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String? username,
      @HiveField(2) String? uid,
      @HiveField(3) String? NIP,
      @HiveField(4) String? EmployeeName,
      @HiveField(5) String? DoH,
      @HiveField(6) String? Office,
      @HiveField(7) String? Department,
      @HiveField(8) String? Position,
      @HiveField(9) String? model_name,
      @HiveField(10) List<double>? embeddings,
      @HiveField(11) double? distance});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? uid = freezed,
    Object? NIP = freezed,
    Object? EmployeeName = freezed,
    Object? DoH = freezed,
    Object? Office = freezed,
    Object? Department = freezed,
    Object? Position = freezed,
    Object? model_name = freezed,
    Object? embeddings = freezed,
    Object? distance = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      NIP: freezed == NIP
          ? _value.NIP
          : NIP // ignore: cast_nullable_to_non_nullable
              as String?,
      EmployeeName: freezed == EmployeeName
          ? _value.EmployeeName
          : EmployeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      DoH: freezed == DoH
          ? _value.DoH
          : DoH // ignore: cast_nullable_to_non_nullable
              as String?,
      Office: freezed == Office
          ? _value.Office
          : Office // ignore: cast_nullable_to_non_nullable
              as String?,
      Department: freezed == Department
          ? _value.Department
          : Department // ignore: cast_nullable_to_non_nullable
              as String?,
      Position: freezed == Position
          ? _value.Position
          : Position // ignore: cast_nullable_to_non_nullable
              as String?,
      model_name: freezed == model_name
          ? _value.model_name
          : model_name // ignore: cast_nullable_to_non_nullable
              as String?,
      embeddings: freezed == embeddings
          ? _value._embeddings
          : embeddings // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'UserAdapter')
class _$UserImpl extends _User {
  _$UserImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.username,
      @HiveField(2) this.uid,
      @HiveField(3) this.NIP,
      @HiveField(4) this.EmployeeName,
      @HiveField(5) this.DoH,
      @HiveField(6) this.Office,
      @HiveField(7) this.Department,
      @HiveField(8) this.Position,
      @HiveField(9) this.model_name,
      @HiveField(10) final List<double>? embeddings,
      @HiveField(11) this.distance})
      : _embeddings = embeddings,
        super._();

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final String? username;
  @override
  @HiveField(2)
  final String? uid;
  @override
  @HiveField(3)
  final String? NIP;
  @override
  @HiveField(4)
  final String? EmployeeName;
  @override
  @HiveField(5)
  final String? DoH;
  @override
  @HiveField(6)
  final String? Office;
  @override
  @HiveField(7)
  final String? Department;
  @override
  @HiveField(8)
  final String? Position;
  @override
  @HiveField(9)
  final String? model_name;
  final List<double>? _embeddings;
  @override
  @HiveField(10)
  List<double>? get embeddings {
    final value = _embeddings;
    if (value == null) return null;
    if (_embeddings is EqualUnmodifiableListView) return _embeddings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(11)
  final double? distance;

  @override
  String toString() {
    return 'User(id: $id, username: $username, uid: $uid, NIP: $NIP, EmployeeName: $EmployeeName, DoH: $DoH, Office: $Office, Department: $Department, Position: $Position, model_name: $model_name, embeddings: $embeddings, distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.NIP, NIP) || other.NIP == NIP) &&
            (identical(other.EmployeeName, EmployeeName) ||
                other.EmployeeName == EmployeeName) &&
            (identical(other.DoH, DoH) || other.DoH == DoH) &&
            (identical(other.Office, Office) || other.Office == Office) &&
            (identical(other.Department, Department) ||
                other.Department == Department) &&
            (identical(other.Position, Position) ||
                other.Position == Position) &&
            (identical(other.model_name, model_name) ||
                other.model_name == model_name) &&
            const DeepCollectionEquality()
                .equals(other._embeddings, _embeddings) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      uid,
      NIP,
      EmployeeName,
      DoH,
      Office,
      Department,
      Position,
      model_name,
      const DeepCollectionEquality().hash(_embeddings),
      distance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User extends User {
  factory _User(
      {@HiveField(0) final int? id,
      @HiveField(1) final String? username,
      @HiveField(2) final String? uid,
      @HiveField(3) final String? NIP,
      @HiveField(4) final String? EmployeeName,
      @HiveField(5) final String? DoH,
      @HiveField(6) final String? Office,
      @HiveField(7) final String? Department,
      @HiveField(8) final String? Position,
      @HiveField(9) final String? model_name,
      @HiveField(10) final List<double>? embeddings,
      @HiveField(11) final double? distance}) = _$UserImpl;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  String? get username;
  @override
  @HiveField(2)
  String? get uid;
  @override
  @HiveField(3)
  String? get NIP;
  @override
  @HiveField(4)
  String? get EmployeeName;
  @override
  @HiveField(5)
  String? get DoH;
  @override
  @HiveField(6)
  String? get Office;
  @override
  @HiveField(7)
  String? get Department;
  @override
  @HiveField(8)
  String? get Position;
  @override
  @HiveField(9)
  String? get model_name;
  @override
  @HiveField(10)
  List<double>? get embeddings;
  @override
  @HiveField(11)
  double? get distance;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
