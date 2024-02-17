// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'working_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkingLocationImpl _$$WorkingLocationImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkingLocationImpl(
      id: json['id'] as int?,
      uid: json['uid'] as String?,
      Name: json['Name'] as String?,
      Latitude: json['Latitude'] as String?,
      Longitude: json['Longitude'] as String?,
      Radius: json['Radius'] as int?,
    );

Map<String, dynamic> _$$WorkingLocationImplToJson(
        _$WorkingLocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'Name': instance.Name,
      'Latitude': instance.Latitude,
      'Longitude': instance.Longitude,
      'Radius': instance.Radius,
    };
