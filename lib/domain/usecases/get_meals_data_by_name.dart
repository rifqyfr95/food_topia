import 'package:food_topia/domain/repositories/meals_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:food_topia/core/error/failures.dart';
import 'package:food_topia/domain/entities/meals_data.dart';



class GetMealsDataByName {
  final MealsDataRepository repository;

  GetMealsDataByName(this.repository);

  Future<Either<Failure, MealsData>> execute({
    required String name,
  }) async {
    return await repository.getMealsDataByName(name);
  }
}