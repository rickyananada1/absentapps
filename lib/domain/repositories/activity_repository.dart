import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../entities/activity_model.dart';
import '../entities/working_location_model.dart';

abstract class ActivityRepository {
  Future<Either<Failure, List<Activity>>> getActivities();
  Future<Either<Failure, List<WorkingLocation>>> getWorkingLocations();
}
