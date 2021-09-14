import 'package:food_topia/data/datasources/meals_data_local_data_source.dart';
import 'package:food_topia/domain/repositories/meals_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_topia/core/error/failures.dart';
import 'package:food_topia/domain/entities/meals_data.dart';
import 'package:food_topia/domain/usecases/usecases.dart';



class UpdateMealsData extends UseCase<MealsData, ParamsUpdateMealsData> {
  final MealsDataRepository repository;

  UpdateMealsData(this.repository);

  @override
  Future<Either<Failure, MealsData>> call(ParamsUpdateMealsData params) async {
    return await repository.updateMeals(params.mealsId, params.favourites);
  }
}

class ParamsUpdateMealsData extends Equatable {

  final String mealsId;
  final int favourites;

  ParamsUpdateMealsData(this.mealsId, this.favourites) : super();

  @override
  List<Object?> get props => [mealsId,favourites];
}