// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      id: json['id'] as int,
      id_pelanggan: json['id_pelanggan'] as int,
      meteran_awal: json['meteran_awal'] as String,
      meteran_akhir: json['meteran_akhir'] as String,
      tgl_pencatatan: json['tgl_pencatatan'] as String,
      periode_tahun: json['periode_tahun'] as int,
      periode_bulan: json['periode_bulan'] as int,
      jumlah_pemakaian: json['jumlah_pemakaian'] as String,
      total_tagihan: json['total_tagihan'] as int,
      noref_tagihan: json['noref_tagihan'] as String,
      total_denda: json['total_denda'] as int?,
      status_pembayaran: json['status_pembayaran'] as int,
      nomor: json['nomor'] as String,
      nama: json['nama'] as String,
      alamat: json['alamat'] as String,
      desa: json['desa'] as String,
      gol_tarif: json['gol_tarif'] as String,
      operator_pencatat: json['operator_pencatat'] as String,
      periode_bulan_name: json['periode_bulan_name'] as String,
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_pelanggan': instance.id_pelanggan,
      'meteran_awal': instance.meteran_awal,
      'meteran_akhir': instance.meteran_akhir,
      'tgl_pencatatan': instance.tgl_pencatatan,
      'periode_tahun': instance.periode_tahun,
      'periode_bulan': instance.periode_bulan,
      'jumlah_pemakaian': instance.jumlah_pemakaian,
      'total_tagihan': instance.total_tagihan,
      'noref_tagihan': instance.noref_tagihan,
      'total_denda': instance.total_denda,
      'status_pembayaran': instance.status_pembayaran,
      'nomor': instance.nomor,
      'nama': instance.nama,
      'alamat': instance.alamat,
      'desa': instance.desa,
      'gol_tarif': instance.gol_tarif,
      'operator_pencatat': instance.operator_pencatat,
      'periode_bulan_name': instance.periode_bulan_name,
    };
