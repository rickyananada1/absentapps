// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerImpl _$$CustomerImplFromJson(Map<String, dynamic> json) =>
    _$CustomerImpl(
      id: json['id'] as int,
      id_user: json['id_user'] as int?,
      nomor: json['nomor'] as String,
      pin: json['pin'] as String,
      nik: json['nik'] as String,
      nama: json['nama'] as String,
      alamat: json['alamat'] as String,
      email: json['email'] as String,
      no_hp: json['no_hp'] as String?,
      geo_lat: json['geo_lat'] as String?,
      geo_lng: json['geo_lng'] as String?,
      flag_name: json['flag_name'] as String,
      flag_desc: json['flag_desc'] as String,
      status_name: json['status_name'] as String,
      status_desc: json['status_desc'] as String,
      tarif_golongan: json['tarif_golongan'] as String,
      tarif_uraian: json['tarif_uraian'] as String,
      tarif_kode: json['tarif_kode'] as String,
      tarif_name: json['tarif_name'] as String,
      tarif_jenis_name: json['tarif_jenis_name'] as String,
      tarif_jenis_desc: json['tarif_jenis_desc'] as String,
      dusun_wil_kode: json['dusun_wil_kode'] as String,
      dusun_wil_name: json['dusun_wil_name'] as String,
      desa_kode: json['desa_kode'] as String,
      desa_name: json['desa_name'] as String,
      kec_kode: json['kec_kode'] as String,
      kec_name: json['kec_name'] as String,
      transaksi_id: json['transaksi_id'] as int?,
      periode_tahun: json['periode_tahun'] as String?,
      periode_bulan: json['periode_bulan'] as String?,
      meteran_awal: json['meteran_awal'] as String?,
      meteran_akhir: json['meteran_akhir'] as String?,
      jumlah_pemakaian: json['jumlah_pemakaian'] as String?,
      periode_bulan_name: json['periode_bulan_name'] as String?,
      transaksi: (json['transaksi'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CustomerImplToJson(_$CustomerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.id_user,
      'nomor': instance.nomor,
      'pin': instance.pin,
      'nik': instance.nik,
      'nama': instance.nama,
      'alamat': instance.alamat,
      'email': instance.email,
      'no_hp': instance.no_hp,
      'geo_lat': instance.geo_lat,
      'geo_lng': instance.geo_lng,
      'flag_name': instance.flag_name,
      'flag_desc': instance.flag_desc,
      'status_name': instance.status_name,
      'status_desc': instance.status_desc,
      'tarif_golongan': instance.tarif_golongan,
      'tarif_uraian': instance.tarif_uraian,
      'tarif_kode': instance.tarif_kode,
      'tarif_name': instance.tarif_name,
      'tarif_jenis_name': instance.tarif_jenis_name,
      'tarif_jenis_desc': instance.tarif_jenis_desc,
      'dusun_wil_kode': instance.dusun_wil_kode,
      'dusun_wil_name': instance.dusun_wil_name,
      'desa_kode': instance.desa_kode,
      'desa_name': instance.desa_name,
      'kec_kode': instance.kec_kode,
      'kec_name': instance.kec_name,
      'transaksi_id': instance.transaksi_id,
      'periode_tahun': instance.periode_tahun,
      'periode_bulan': instance.periode_bulan,
      'meteran_awal': instance.meteran_awal,
      'meteran_akhir': instance.meteran_akhir,
      'jumlah_pemakaian': instance.jumlah_pemakaian,
      'periode_bulan_name': instance.periode_bulan_name,
      'transaksi': instance.transaksi,
    };
