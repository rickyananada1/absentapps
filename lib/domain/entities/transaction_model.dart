import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

typedef TransactionList = List<Transaction>;

@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction({
    required int id,
    required int id_pelanggan,
    required String meteran_awal,
    required String meteran_akhir,
    required String tgl_pencatatan,
    required int periode_tahun,
    required int periode_bulan,
    required String jumlah_pemakaian,
    required int total_tagihan,
    required String noref_tagihan,
    required int? total_denda,
    required int status_pembayaran,
    required String nomor,
    required String nama,
    required String alamat,
    required String desa,
    required String gol_tarif,
    required String operator_pencatat,
    required String periode_bulan_name,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
