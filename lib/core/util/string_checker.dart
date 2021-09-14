import 'package:dartz/dartz.dart';

import 'package:food_topia/core/error/failures.dart';

class InputConverter {
  Either<Failure, String> stringChecker(String str) {
    try {

      String pattern = r'^[0-9]+$''';
      RegExp regExp = new RegExp(pattern);
      if (!regExp.hasMatch(str)){
        throw FormatException();
      }
      return Right(str);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => throw [];

}