import 'package:hive/hive.dart';

import '../domain/entities/user.dart';

class LocalDb {
  // create or update user
  Future<void> saveUser(User user, String _userBox) async {
    final box = await Hive.openBox<User>(_userBox);
    await box.put('user', user);
  }

  // get user
  Future<User?> getUser(String _userBox) async {
    final box = await Hive.openBox<User>(_userBox);
    return box.get('user');
  }

  // delete user
  Future<void> deleteUser(String _userBox) async {
    final box = await Hive.openBox<User>(_userBox);
    await box.delete('user');
  }
}
