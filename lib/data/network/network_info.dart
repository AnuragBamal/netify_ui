import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplementer implements NetworkInfo {
  final InternetConnectionChecker _connectionChecker;

  NetworkInfoImplementer(this._connectionChecker);

  @override
  Future<bool> get isConnected => _connectionChecker.hasConnection;
}
