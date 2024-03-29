import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/failure.dart';
import '../../domain/entities/activity_model.dart';
import '../../domain/entities/working_location_model.dart';
import '../datasource/remote/api_provider.dart';

class ActivityRepository {
  final ApiProvider _apiProvider;

  ActivityRepository({required ApiProvider apiProvider})
      : _apiProvider = apiProvider;

  Future<Either<Failure, Response>> getActivities(
      {String? query,
      required String C_BPartner_ID,
      String? orderBy,
      int? top,
      int? skip,
      int? page}) async {
    return await _apiProvider.getActivities(query, C_BPartner_ID,
        orderBy: orderBy, top: top, skip: skip, page: page);
  }

  Future<Either<Failure, List<WorkingLocation>>> getWorkingLocations() async {
    return await _apiProvider.getWorkingLocations();
  }

  Future<Either<Failure, String>> getAddress(
      double latitude, double longitude) async {
    return await _apiProvider.getAddress(latitude, longitude);
  }

  Future<Either<Failure, Activity>> postAttendance(
      String partnerId,
      DateTime date,
      double latitude,
      double longitude,
      int distance,
      String fingerType,
      String locationName) async {
    return await _apiProvider.postAttendance(partnerId, date, latitude,
        longitude, distance, fingerType, locationName);
  }
}
