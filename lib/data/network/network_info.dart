import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplementer implements NetworkInfo {
  final InternetConnectionChecker _connectionChecker;
  final Completer<bool> result = Completer<bool>();

  NetworkInfoImplementer(this._connectionChecker) {
    result.complete(true);
  }

  // @override
  // Future<bool> get isConnected => _connectionChecker.hasConnection;

  @override
  Future<bool> get isConnected => result.future;
}
