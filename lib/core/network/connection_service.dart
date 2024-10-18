import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:test_task/common/data/interfaces/i_connection_service.dart';

@Singleton(as: IConnectionService)
class ConnectionService implements IConnectionService{
  @override
  Future<bool> checkConnection() {
    return InternetConnectionChecker().hasConnection;
  }
}