import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_model.freezed.dart';
part 'invoice_model.g.dart';

@freezed
abstract class Invoice with _$Invoice {
  const factory Invoice({
    required int id,
    required int id_pelanggan,
    required String meteran_awal,
    required String meteran_akhir,
    required String tgl_pencatatan,
    required int periode_tahun,
    required int periode_bulan,
    required String jumlah_pemakaian,
    required int tagihan_pemakaian,
    required int tagihan_administrasi,
    required int tagihan_beban,
    required int total_tagihan,
    required String noref_tagihan,
    required String? kode_billing,
    required int? denda_pemakaian,
    required int? denda_administrasi,
    required int? total_denda,
    required int status_pembayaran,
    required String nomor,
    required String nama_pel,
    required String alamat_pel,
    required String gol_tarif,
    required String dusun,
    required String desa,
    required String kec,
    required String operator_pencatat,
    required String status_tagihan,
    required String? periode_bulan_name,
    required int? pembayaran_id,
    required String? tgl_pembayaran,
    required String? channel_pembayaran,
    required String? operator_pembayaran,
    required int? pembayaran_tagihan_pemakaian,
    required int? pembayaran_tagihan_administrasi,
    required int? pembayaran_tagihan_beban,
    required int? pembayaran_denda_pemakaian,
    required int? pembayaran_denda_administrasi,
    required int? total_pembayaran,
    required String? noref_pembayaran,
    required String? status_setoran,
    required String? struk,
  }) = _Invoice;

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);
}
