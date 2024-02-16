import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../core/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, Response>> login(String username, String password);
  Future<Either<Failure, Response>> getProfile();
}
