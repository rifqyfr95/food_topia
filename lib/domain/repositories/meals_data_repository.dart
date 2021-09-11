import 'package:dartz/dartz.dart';
import 'package:food_topia/core/error/failures.dart';
import 'package:food_topia/domain/entities/meals_data.dart';


abstract class MealsDataRepository {
  Future<Either<Failure, MealsData>> getMealsDataByName(String mealsName);
  Future<Either<Failure, MealsData>> getMealsDataByInitial(String mealsInitial);
}

