import 'package:freezed_annotation/freezed_annotation.dart';

import 'finger_type_model.dart';

part 'activity_model.freezed.dart';
part 'activity_model.g.dart';

@freezed
abstract class Activity with _$Activity {
  const factory Activity({
    required int? id,
    required String? uid,
    required DateTime? DateFinger,
    required String? Latitude,
    required String? Longitude,
    required double? Distance,
    required FingerTypeModel? FingerType,
    required String? location,
  }) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}
