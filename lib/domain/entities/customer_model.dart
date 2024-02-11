import 'package:freezed_annotation/freezed_annotation.dart';

import 'transaction_model.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

typedef CustomerList = List<Customer>;

@freezed
abstract class Customer with _$Customer {
  const factory Customer({
    required int id,
    required int? id_user,
    required String nomor,
    required String pin,
    required String nik,
    required String nama,
    required String alamat,
    required String email,
    required String? no_hp,
    required String? geo_lat,
    required String? geo_lng,
    required String flag_name,
    required String flag_desc,
    required String status_name,
    required String status_desc,
    required String tarif_golongan,
    required String tarif_uraian,
    required String tarif_kode,
    required String tarif_name,
    required String tarif_jenis_name,
    required String tarif_jenis_desc,
    required String dusun_wil_kode,
    required String dusun_wil_name,
    required String desa_kode,
    required String desa_name,
    required String kec_kode,
    required String kec_name,
    required int? transaksi_id,
    required String? periode_tahun,
    required String? periode_bulan,
    required String? meteran_awal,
    required String? meteran_akhir,
    required String? jumlah_pemakaian,
    required String? periode_bulan_name,
    required TransactionList? transaksi,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}
