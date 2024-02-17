import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0, adapterName: 'UserAdapter')
class User extends HiveObject {
  User._();
  @HiveField(0)
  String? NIP;
  @HiveField(1)
  String? EmployeeName;
  @HiveField(2)
  List<double>? embeddings;
  @HiveField(3)
  String? C_BPartner_ID;

  User(
      {required this.NIP,
      required this.EmployeeName,
      required this.embeddings,
      required this.C_BPartner_ID});
}
