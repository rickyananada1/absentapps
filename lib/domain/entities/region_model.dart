import 'package:freezed_annotation/freezed_annotation.dart';

part 'region_model.freezed.dart';
part 'region_model.g.dart';

typedef RegionList = List<Region>;

@freezed
abstract class Region with _$Region {
  const factory Region({
    required int id,
    required int id_dusun_wilayah,
    required String nama_dusun,
    required int id_desa,
    required String nama_desa,
    required int id_kecamatan,
    required String nama_kecamatan,
    required int jlh_pelanggan,
    required int tercatat,
    required double persentase,
  }) = _Region;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
}
