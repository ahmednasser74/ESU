import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInformation {
  Future<bool> get isConnected;
}

@Injectable(as: NetworkInformation)
class NetworkInformationImp implements NetworkInformation {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInformationImp({required this.internetConnectionChecker});
  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}
