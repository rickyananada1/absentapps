import 'package:freezed_annotation/freezed_annotation.dart';

part 'ad_clientinfo.freezed.dart';
part 'ad_clientinfo.g.dart';

@freezed
abstract class AdClientinfo with _$AdClientinfo {
  const factory AdClientinfo({
    required int id,
    required String uid,
    required String name,
    required String image,
  }) = _AdClientinfo;

  factory AdClientinfo.fromJson(Map<String, dynamic> json) =>
      _$AdClientinfoFromJson(json);
}
