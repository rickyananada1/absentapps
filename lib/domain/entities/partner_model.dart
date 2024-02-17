import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner_model.freezed.dart';
part 'partner_model.g.dart';

@freezed
abstract class C_BPartner_IDModel with _$C_BPartner_IDModel {
  const factory C_BPartner_IDModel({
    required int? id,
    required String? identifier,
  }) = _C_BPartner_IDModel;

  factory C_BPartner_IDModel.fromJson(Map<String, dynamic> json) =>
      _$C_BPartner_IDModelFromJson(json);
}
