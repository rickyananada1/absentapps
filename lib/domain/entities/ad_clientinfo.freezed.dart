// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad_clientinfo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdClientinfo _$AdClientinfoFromJson(Map<String, dynamic> json) {
  return _AdClientinfo.fromJson(json);
}

/// @nodoc
mixin _$AdClientinfo {
  int get id => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdClientinfoCopyWith<AdClientinfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdClientinfoCopyWith<$Res> {
  factory $AdClientinfoCopyWith(
          AdClientinfo value, $Res Function(AdClientinfo) then) =
      _$AdClientinfoCopyWithImpl<$Res, AdClientinfo>;
  @useResult
  $Res call({int id, String uid, String name, String image});
}

/// @nodoc
class _$AdClientinfoCopyWithImpl<$Res, $Val extends AdClientinfo>
    implements $AdClientinfoCopyWith<$Res> {
  _$AdClientinfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdClientinfoImplCopyWith<$Res>
    implements $AdClientinfoCopyWith<$Res> {
  factory _$$AdClientinfoImplCopyWith(
          _$AdClientinfoImpl value, $Res Function(_$AdClientinfoImpl) then) =
      __$$AdClientinfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String uid, String name, String image});
}

/// @nodoc
class __$$AdClientinfoImplCopyWithImpl<$Res>
    extends _$AdClientinfoCopyWithImpl<$Res, _$AdClientinfoImpl>
    implements _$$AdClientinfoImplCopyWith<$Res> {
  __$$AdClientinfoImplCopyWithImpl(
      _$AdClientinfoImpl _value, $Res Function(_$AdClientinfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_$AdClientinfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdClientinfoImpl implements _AdClientinfo {
  const _$AdClientinfoImpl(
      {required this.id,
      required this.uid,
      required this.name,
      required this.image});

  factory _$AdClientinfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdClientinfoImplFromJson(json);

  @override
  final int id;
  @override
  final String uid;
  @override
  final String name;
  @override
  final String image;

  @override
  String toString() {
    return 'AdClientinfo(id: $id, uid: $uid, name: $name, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdClientinfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, uid, name, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdClientinfoImplCopyWith<_$AdClientinfoImpl> get copyWith =>
      __$$AdClientinfoImplCopyWithImpl<_$AdClientinfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdClientinfoImplToJson(
      this,
    );
  }
}

abstract class _AdClientinfo implements AdClientinfo {
  const factory _AdClientinfo(
      {required final int id,
      required final String uid,
      required final String name,
      required final String image}) = _$AdClientinfoImpl;

  factory _AdClientinfo.fromJson(Map<String, dynamic> json) =
      _$AdClientinfoImpl.fromJson;

  @override
  int get id;
  @override
  String get uid;
  @override
  String get name;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$AdClientinfoImplCopyWith<_$AdClientinfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
