import 'package:connectivity/connectivity.dart';
import 'package:food_topia/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected async {
    var res = false;
    var connectResult = await (Connectivity().checkConnectivity());
    if(connectResult == ConnectivityResult.wifi || connectResult == ConnectivityResult.mobile){
      res = true;
    }else {
      res = false;
    }
    return res;
  }

  Future<Either<Failure, bool>> connectionCheck() async {
    try {
      bool status = await isConnected;
      if(!status){
        throw Exception();
      }
      return Right(status);
    } on Exception {
      return Left(InvalidInputFailure());
    }
  }
}
class InvalidInputFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => throw [];

}