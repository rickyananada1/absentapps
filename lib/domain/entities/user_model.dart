import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String username,
    required String name,
    required String no_hp,
    required String email,
    required String jenis,
    required String periode_bulan,
    required String periode_bulan_name,
    required String periode_tahun,
    required int total_pelanggan,
    required int tercatat,
    required double persentase,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
