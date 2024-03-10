import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
abstract class Address with _$Address {
  const factory Address({
    required String? historic,
    required String? road,
    required String? city_block,
    required String? neighbourhood,
    required String? suburb,
    required String? city_district,
    required String? city,
    required String? ISO3166_2_lvl4,
    required String? region,
    required String? ISO3166_2_lvl3,
    required String? postcode,
    required String? country,
    required String? country_code,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
