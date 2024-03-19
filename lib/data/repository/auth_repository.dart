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

  Future<Either<Failure, UserModel>> getProfile(String userId) async {
    return await _apiProvider.getProfile(userId);
  }

  Future<Either<Failure, Response>> getCompanyProfile() async {
    return await _apiProvider.getCompanyProfile();
  }

  Future<Either<Failure, Response>> putBiometric(List<double> biometric,
      String name, String image, String C_BPartner_ID) async {
    return await _apiProvider.putBiometric(
        biometric, name, image, C_BPartner_ID);
  }
}
