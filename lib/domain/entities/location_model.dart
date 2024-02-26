import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
abstract class HR_Location_IDModel with _$HR_Location_IDModel {
  const factory HR_Location_IDModel({
    required int? id,
    required String? identifier,
  }) = _HR_Location_IDModel;

  factory HR_Location_IDModel.fromJson(Map<String, dynamic> json) =>
      _$HR_Location_IDModelFromJson(json);
}
