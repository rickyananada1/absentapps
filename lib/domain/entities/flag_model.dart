import 'package:freezed_annotation/freezed_annotation.dart';

part 'flag_model.freezed.dart';
part 'flag_model.g.dart';

typedef FlagList = List<Flag>;

@freezed
abstract class Flag with _$Flag {
  const factory Flag({
    required int id,
    required String value,
  }) = _Flag;

  factory Flag.fromJson(Map<String, dynamic> json) => _$FlagFromJson(json);
}
