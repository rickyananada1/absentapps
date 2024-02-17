import 'package:get_it/get_it.dart';
import 'package:nb_utils/nb_utils.dart';

import '../data/datasource/remote/api_provider.dart';
import '../data/repository/activity_repository.dart';
import '../data/repository/auth_repository.dart';
import '../presentation/controllers/activity_controller.dart';
import '../presentation/controllers/auth_controller.dart';
import 'network_info.dart';
import 'request.dart';

final serviceLocator = GetIt.instance;
Future<void> setUpServiceLocator() async {
  // Register SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  // Register Request
  serviceLocator.registerLazySingleton(() => Request());

  // Register NetworkInfo
  serviceLocator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // Register ApiProvider
  serviceLocator.registerLazySingleton(() => ApiProvider(
        request: serviceLocator<Request>(),
        sharedPreferences: serviceLocator<SharedPreferences>(),
        networkInfo: serviceLocator<NetworkInfo>(),
      ));

  // Register AuthRepository
  serviceLocator.registerLazySingleton(() => AuthRepository(
        apiProvider: serviceLocator<ApiProvider>(),
      ));

  // Register ActivityRepository
  serviceLocator.registerLazySingleton(() => ActivityRepository(
        apiProvider: serviceLocator<ApiProvider>(),
      ));

  // Register AuthController
  serviceLocator.registerLazySingleton(() => AuthController());

  // Register ActivityController
  serviceLocator.registerLazySingleton(() => ActivityController());
}
