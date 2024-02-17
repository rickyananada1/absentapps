import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../../domain/entities/activity_model.dart';
import '../../domain/entities/working_location_model.dart';
import '../datasource/remote/api_provider.dart';

class ActivityRepository {
  final ApiProvider _apiProvider;

  ActivityRepository({required ApiProvider apiProvider})
      : _apiProvider = apiProvider;

  Future<Either<Failure, List<Activity>>> getActivities() async {
    return await _apiProvider.getActivities();
  }

  Future<Either<Failure, List<WorkingLocation>>> getWorkingLocations() async {
    return await _apiProvider.getWorkingLocations();
  }

  Future<Either<Failure, Activity>> postAttendance(
      String partnerId,
      DateTime date,
      double latitude,
      double longitude,
      int distance,
      String fingerType) async {
    return await _apiProvider.postAttendance(
        partnerId, date, latitude, longitude, distance, fingerType);
  }
}
