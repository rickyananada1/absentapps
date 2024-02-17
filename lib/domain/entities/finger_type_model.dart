import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'finger_type_model.freezed.dart';
part 'finger_type_model.g.dart';

@freezed
abstract class FingerTypeModel with _$FingerTypeModel {
  const factory FingerTypeModel({
    @HiveField(0) String? id,
    @HiveField(1) String? identifier,
    @HiveField(2) String? model_name,
  }) = _FingerTypeModel;

  factory FingerTypeModel.fromJson(Map<String, dynamic> json) =>
      _$FingerTypeModelFromJson(json);
}
