// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityImpl _$$ActivityImplFromJson(Map<String, dynamic> json) =>
    _$ActivityImpl(
      id: json['id'] as int?,
      uid: json['uid'] as String?,
      DateFinger: json['DateFinger'] == null
          ? null
          : DateTime.parse(json['DateFinger'] as String),
      Latitude: json['Latitude'] as String?,
      Longitude: json['Longitude'] as String?,
      Distance: (json['Distance'] as num?)?.toDouble(),
      FingerType: json['FingerType'] == null
          ? null
          : FingerTypeModel.fromJson(
              json['FingerType'] as Map<String, dynamic>),
      location: json['location'] as String?,
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'DateFinger': instance.DateFinger?.toIso8601String(),
      'Latitude': instance.Latitude,
      'Longitude': instance.Longitude,
      'Distance': instance.Distance,
      'FingerType': instance.FingerType,
      'location': instance.location,
    };
