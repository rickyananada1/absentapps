import 'package:hive/hive.dart';

import '../domain/entities/user.dart';

class LocalDb {
  // create or update user
  Future<void> saveUser(User user, String userBox) async {
    final box = await Hive.openBox<User>(userBox);
    await box.put('user', user);
  }

  // get user
  Future<User?> getUser(String userBox) async {
    final box = await Hive.openBox<User>(userBox);
    return box.get('user');
  }

  // delete user
  Future<void> deleteUser(String userBox) async {
    final box = await Hive.openBox<User>(userBox);
    await box.delete('user');
  }
}
