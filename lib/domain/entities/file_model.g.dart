// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileModelImpl _$$FileModelImplFromJson(Map<String, dynamic> json) =>
    _$FileModelImpl(
      name: json['name'] as String,
      url: json['url'] as String,
      mine: json['mine'] as String,
      bytes: json['bytes'] as int,
      size: json['size'] as String,
    );

Map<String, dynamic> _$$FileModelImplToJson(_$FileModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'mine': instance.mine,
      'bytes': instance.bytes,
      'size': instance.size,
    };
