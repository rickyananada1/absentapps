import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class User extends HiveObject with _$User {
  User._();
  @HiveType(typeId: 0, adapterName: 'UserAdapter')
  factory User({
    @HiveField(0) int? id,
    @HiveField(1) String? username,
    @HiveField(2) List<double>? embeddings,
    @HiveField(3) double? distance,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
