import 'package:food_topia/domain/repositories/meals_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:food_topia/core/error/failures.dart';
import 'package:food_topia/domain/entities/meals_data.dart';

class GetMealsDataByInitial {
  final MealsDataRepository repository;

  GetMealsDataByInitial(this.repository);

  Future<Either<Failure, MealsData>> execute({
    required String initial,
  }) async {
    return await repository.getMealsDataByInitial(initial);
  }
}