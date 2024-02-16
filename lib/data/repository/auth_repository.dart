import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../core/failure.dart';
import '../../domain/entities/user_model.dart';
import '../datasource/remote/api_provider.dart';

class AuthRepository {
  final ApiProvider _apiProvider;

  AuthRepository({required ApiProvider apiProvider})
      : _apiProvider = apiProvider;

  Future<Either<Failure, Response>> login(
      String username, String password) async {
    return await _apiProvider.login(username, password);
  }

  Future<Either<Failure, User>> getProfile(String userId) async {
    return await _apiProvider.getProfile(userId);
  }

  Future<Either<Failure, Response>> postImages(
      String name, String description, String image) async {
    return await _apiProvider.postImages(name, description, image);
  }

  // Future<Either<Failure, Response>> logout() async {
  //   return await _apiProvider.logout();
  // }
}
