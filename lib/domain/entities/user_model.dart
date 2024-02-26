import 'package:freezed_annotation/freezed_annotation.dart';

import 'partner_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required int? id,
    required String? uid,
    required C_BPartner_IDModel? C_BPartner_ID,
    required String? NIP,
    required String? EmployeeName,
    required String? DoH,
    required String? Office,
    required String? Department,
    required String? Position,
    required bool? IsAllowFingerfromAnywhere,
    required String? model_name,
    required List<double>? embeddings,
    required double? distance,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
