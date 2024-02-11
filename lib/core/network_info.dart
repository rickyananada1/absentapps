import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl extends NetworkInfo {
  bool hasInternetAccess = false;
  bool isDomainReachable = false;

  @override
  Future<bool> get isConnected async {
    hasInternetAccess = await InternetConnection().hasInternetAccess;
    return hasInternetAccess;
  }
}
