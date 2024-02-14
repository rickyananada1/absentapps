import 'package:hive/hive.dart';

import '../domain/entities/user_model.dart';

class LocalDb {
  static const String _userBox = 'userBox';

  // create or update user
  Future<void> saveUser(User user) async {
    final box = await Hive.openBox<User>(_userBox);
    await box.put('user', user);
  }

  // get user
  Future<User?> getUser() async {
    final box = await Hive.openBox<User>(_userBox);
    return box.get('user');
  }

  // delete user
  Future<void> deleteUser() async {
    final box = await Hive.openBox<User>(_userBox);
    await box.delete('user');
  }
}
