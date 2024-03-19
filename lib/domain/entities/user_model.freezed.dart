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

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int? get id => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  C_BPartner_IDModel? get C_BPartner_ID => throw _privateConstructorUsedError;
  String? get NIP => throw _privateConstructorUsedError;
  String? get EmployeeName => throw _privateConstructorUsedError;
  String? get DoH => throw _privateConstructorUsedError;
  String? get Office => throw _privateConstructorUsedError;
  String? get Department => throw _privateConstructorUsedError;
  String? get Position => throw _privateConstructorUsedError;
  bool get IsAllowFingerfromAnywhere => throw _privateConstructorUsedError;
  String? get model_name => throw _privateConstructorUsedError;
  List<double>? get embeddings => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  List<double>? get biometric => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int? id,
      String? uid,
      C_BPartner_IDModel? C_BPartner_ID,
      String? NIP,
      String? EmployeeName,
      String? DoH,
      String? Office,
      String? Department,
      String? Position,
      bool IsAllowFingerfromAnywhere,
      String? model_name,
      List<double>? embeddings,
      double? distance,
      List<double>? biometric});

  $C_BPartner_IDModelCopyWith<$Res>? get C_BPartner_ID;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? C_BPartner_ID = freezed,
    Object? NIP = freezed,
    Object? EmployeeName = freezed,
    Object? DoH = freezed,
    Object? Office = freezed,
    Object? Department = freezed,
    Object? Position = freezed,
    Object? IsAllowFingerfromAnywhere = null,
    Object? model_name = freezed,
    Object? embeddings = freezed,
    Object? distance = freezed,
    Object? biometric = freezed,
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
      C_BPartner_ID: freezed == C_BPartner_ID
          ? _value.C_BPartner_ID
          : C_BPartner_ID // ignore: cast_nullable_to_non_nullable
              as C_BPartner_IDModel?,
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
      IsAllowFingerfromAnywhere: null == IsAllowFingerfromAnywhere
          ? _value.IsAllowFingerfromAnywhere
          : IsAllowFingerfromAnywhere // ignore: cast_nullable_to_non_nullable
              as bool,
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
      biometric: freezed == biometric
          ? _value.biometric
          : biometric // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $C_BPartner_IDModelCopyWith<$Res>? get C_BPartner_ID {
    if (_value.C_BPartner_ID == null) {
      return null;
    }

    return $C_BPartner_IDModelCopyWith<$Res>(_value.C_BPartner_ID!, (value) {
      return _then(_value.copyWith(C_BPartner_ID: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? uid,
      C_BPartner_IDModel? C_BPartner_ID,
      String? NIP,
      String? EmployeeName,
      String? DoH,
      String? Office,
      String? Department,
      String? Position,
      bool IsAllowFingerfromAnywhere,
      String? model_name,
      List<double>? embeddings,
      double? distance,
      List<double>? biometric});

  @override
  $C_BPartner_IDModelCopyWith<$Res>? get C_BPartner_ID;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? C_BPartner_ID = freezed,
    Object? NIP = freezed,
    Object? EmployeeName = freezed,
    Object? DoH = freezed,
    Object? Office = freezed,
    Object? Department = freezed,
    Object? Position = freezed,
    Object? IsAllowFingerfromAnywhere = null,
    Object? model_name = freezed,
    Object? embeddings = freezed,
    Object? distance = freezed,
    Object? biometric = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      C_BPartner_ID: freezed == C_BPartner_ID
          ? _value.C_BPartner_ID
          : C_BPartner_ID // ignore: cast_nullable_to_non_nullable
              as C_BPartner_IDModel?,
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
      IsAllowFingerfromAnywhere: null == IsAllowFingerfromAnywhere
          ? _value.IsAllowFingerfromAnywhere
          : IsAllowFingerfromAnywhere // ignore: cast_nullable_to_non_nullable
              as bool,
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
      biometric: freezed == biometric
          ? _value._biometric
          : biometric // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {required this.id,
      required this.uid,
      required this.C_BPartner_ID,
      required this.NIP,
      required this.EmployeeName,
      required this.DoH,
      required this.Office,
      required this.Department,
      required this.Position,
      this.IsAllowFingerfromAnywhere = false,
      required this.model_name,
      required final List<double>? embeddings,
      required this.distance,
      required final List<double>? biometric})
      : _embeddings = embeddings,
        _biometric = biometric;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? uid;
  @override
  final C_BPartner_IDModel? C_BPartner_ID;
  @override
  final String? NIP;
  @override
  final String? EmployeeName;
  @override
  final String? DoH;
  @override
  final String? Office;
  @override
  final String? Department;
  @override
  final String? Position;
  @override
  @JsonKey()
  final bool IsAllowFingerfromAnywhere;
  @override
  final String? model_name;
  final List<double>? _embeddings;
  @override
  List<double>? get embeddings {
    final value = _embeddings;
    if (value == null) return null;
    if (_embeddings is EqualUnmodifiableListView) return _embeddings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? distance;
  final List<double>? _biometric;
  @override
  List<double>? get biometric {
    final value = _biometric;
    if (value == null) return null;
    if (_biometric is EqualUnmodifiableListView) return _biometric;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserModel(id: $id, uid: $uid, C_BPartner_ID: $C_BPartner_ID, NIP: $NIP, EmployeeName: $EmployeeName, DoH: $DoH, Office: $Office, Department: $Department, Position: $Position, IsAllowFingerfromAnywhere: $IsAllowFingerfromAnywhere, model_name: $model_name, embeddings: $embeddings, distance: $distance, biometric: $biometric)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.C_BPartner_ID, C_BPartner_ID) ||
                other.C_BPartner_ID == C_BPartner_ID) &&
            (identical(other.NIP, NIP) || other.NIP == NIP) &&
            (identical(other.EmployeeName, EmployeeName) ||
                other.EmployeeName == EmployeeName) &&
            (identical(other.DoH, DoH) || other.DoH == DoH) &&
            (identical(other.Office, Office) || other.Office == Office) &&
            (identical(other.Department, Department) ||
                other.Department == Department) &&
            (identical(other.Position, Position) ||
                other.Position == Position) &&
            (identical(other.IsAllowFingerfromAnywhere,
                    IsAllowFingerfromAnywhere) ||
                other.IsAllowFingerfromAnywhere == IsAllowFingerfromAnywhere) &&
            (identical(other.model_name, model_name) ||
                other.model_name == model_name) &&
            const DeepCollectionEquality()
                .equals(other._embeddings, _embeddings) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            const DeepCollectionEquality()
                .equals(other._biometric, _biometric));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uid,
      C_BPartner_ID,
      NIP,
      EmployeeName,
      DoH,
      Office,
      Department,
      Position,
      IsAllowFingerfromAnywhere,
      model_name,
      const DeepCollectionEquality().hash(_embeddings),
      distance,
      const DeepCollectionEquality().hash(_biometric));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final int? id,
      required final String? uid,
      required final C_BPartner_IDModel? C_BPartner_ID,
      required final String? NIP,
      required final String? EmployeeName,
      required final String? DoH,
      required final String? Office,
      required final String? Department,
      required final String? Position,
      final bool IsAllowFingerfromAnywhere,
      required final String? model_name,
      required final List<double>? embeddings,
      required final double? distance,
      required final List<double>? biometric}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get uid;
  @override
  C_BPartner_IDModel? get C_BPartner_ID;
  @override
  String? get NIP;
  @override
  String? get EmployeeName;
  @override
  String? get DoH;
  @override
  String? get Office;
  @override
  String? get Department;
  @override
  String? get Position;
  @override
  bool get IsAllowFingerfromAnywhere;
  @override
  String? get model_name;
  @override
  List<double>? get embeddings;
  @override
  double? get distance;
  @override
  List<double>? get biometric;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
