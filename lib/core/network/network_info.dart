import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetWorkInfo {
  Future<bool> get isNetWorkConnected;
}

class NetWorkInfoImpl implements NetWorkInfo {
  final InternetConnectionChecker connectionChecker;
  NetWorkInfoImpl({required this.connectionChecker});
  @override
  Future<bool> get isNetWorkConnected async =>
      await connectionChecker.hasConnection;
}
