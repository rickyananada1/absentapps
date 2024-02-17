import 'package:freezed_annotation/freezed_annotation.dart';

part 'working_location_model.freezed.dart';
part 'working_location_model.g.dart';

@freezed
abstract class WorkingLocation with _$WorkingLocation {
  const factory WorkingLocation({
    required int? id,
    required String? uid,
    required String? Name,
    required String? Latitude,
    required String? Longitude,
    required int? Radius,
  }) = _WorkingLocation;

  factory WorkingLocation.fromJson(Map<String, dynamic> json) =>
      _$WorkingLocationFromJson(json);
}
