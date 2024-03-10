// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      historic: json['historic'] as String?,
      road: json['road'] as String?,
      city_block: json['city_block'] as String?,
      neighbourhood: json['neighbourhood'] as String?,
      suburb: json['suburb'] as String?,
      city_district: json['city_district'] as String?,
      city: json['city'] as String?,
      ISO3166_2_lvl4: json['ISO3166_2_lvl4'] as String?,
      region: json['region'] as String?,
      ISO3166_2_lvl3: json['ISO3166_2_lvl3'] as String?,
      postcode: json['postcode'] as String?,
      country: json['country'] as String?,
      country_code: json['country_code'] as String?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'historic': instance.historic,
      'road': instance.road,
      'city_block': instance.city_block,
      'neighbourhood': instance.neighbourhood,
      'suburb': instance.suburb,
      'city_district': instance.city_district,
      'city': instance.city,
      'ISO3166_2_lvl4': instance.ISO3166_2_lvl4,
      'region': instance.region,
      'ISO3166_2_lvl3': instance.ISO3166_2_lvl3,
      'postcode': instance.postcode,
      'country': instance.country,
      'country_code': instance.country_code,
    };
