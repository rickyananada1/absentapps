// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegionImpl _$$RegionImplFromJson(Map<String, dynamic> json) => _$RegionImpl(
      id: json['id'] as int,
      id_dusun_wilayah: json['id_dusun_wilayah'] as int,
      nama_dusun: json['nama_dusun'] as String,
      id_desa: json['id_desa'] as int,
      nama_desa: json['nama_desa'] as String,
      id_kecamatan: json['id_kecamatan'] as int,
      nama_kecamatan: json['nama_kecamatan'] as String,
      jlh_pelanggan: json['jlh_pelanggan'] as int,
      tercatat: json['tercatat'] as int,
      persentase: (json['persentase'] as num).toDouble(),
    );

Map<String, dynamic> _$$RegionImplToJson(_$RegionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_dusun_wilayah': instance.id_dusun_wilayah,
      'nama_dusun': instance.nama_dusun,
      'id_desa': instance.id_desa,
      'nama_desa': instance.nama_desa,
      'id_kecamatan': instance.id_kecamatan,
      'nama_kecamatan': instance.nama_kecamatan,
      'jlh_pelanggan': instance.jlh_pelanggan,
      'tercatat': instance.tercatat,
      'persentase': instance.persentase,
    };
