// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      username: json['username'] as String,
      name: json['name'] as String,
      no_hp: json['no_hp'] as String,
      email: json['email'] as String,
      jenis: json['jenis'] as String,
      periode_bulan: json['periode_bulan'] as String,
      periode_bulan_name: json['periode_bulan_name'] as String,
      periode_tahun: json['periode_tahun'] as String,
      total_pelanggan: json['total_pelanggan'] as int,
      tercatat: json['tercatat'] as int,
      persentase: (json['persentase'] as num).toDouble(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'no_hp': instance.no_hp,
      'email': instance.email,
      'jenis': instance.jenis,
      'periode_bulan': instance.periode_bulan,
      'periode_bulan_name': instance.periode_bulan_name,
      'periode_tahun': instance.periode_tahun,
      'total_pelanggan': instance.total_pelanggan,
      'tercatat': instance.tercatat,
      'persentase': instance.persentase,
    };
