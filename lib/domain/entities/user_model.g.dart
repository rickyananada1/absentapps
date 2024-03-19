// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as int?,
      uid: json['uid'] as String?,
      C_BPartner_ID: json['C_BPartner_ID'] == null
          ? null
          : C_BPartner_IDModel.fromJson(
              json['C_BPartner_ID'] as Map<String, dynamic>),
      NIP: json['NIP'] as String?,
      EmployeeName: json['EmployeeName'] as String?,
      DoH: json['DoH'] as String?,
      Office: json['Office'] as String?,
      Department: json['Department'] as String?,
      Position: json['Position'] as String?,
      IsAllowFingerfromAnywhere:
          json['IsAllowFingerfromAnywhere'] as bool? ?? false,
      model_name: json['model_name'] as String?,
      embeddings: (json['embeddings'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      distance: (json['distance'] as num?)?.toDouble(),
      biometric: (json['biometric'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'C_BPartner_ID': instance.C_BPartner_ID,
      'NIP': instance.NIP,
      'EmployeeName': instance.EmployeeName,
      'DoH': instance.DoH,
      'Office': instance.Office,
      'Department': instance.Department,
      'Position': instance.Position,
      'IsAllowFingerfromAnywhere': instance.IsAllowFingerfromAnywhere,
      'model_name': instance.model_name,
      'embeddings': instance.embeddings,
      'distance': instance.distance,
      'biometric': instance.biometric,
    };
