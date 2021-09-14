import 'package:food_topia/features/data/datasources/meals_data_local_data_source.dart';
import 'package:food_topia/features/domain/repositories/meals_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_topia/core/error/failures.dart';
import 'package:food_topia/features/domain/entities/meals_data.dart';
import 'package:food_topia/core/usecases/usecases.dart';



class UpdateMealsDataByIdWithoutFavourites extends UseCase<MealsData, ParamsUpdateMealsDataWithoutFav> {
  final MealsDataRepository repository;

  UpdateMealsDataByIdWithoutFavourites(this.repository);

  @override
  Future<Either<Failure, MealsData>> call(ParamsUpdateMealsDataWithoutFav params) async {
    return await repository.updateMealsDataWithoutFavorite(params.mealsId);
  }
}

class ParamsUpdateMealsDataWithoutFav extends Equatable {

  final String mealsId;

  ParamsUpdateMealsDataWithoutFav(this.mealsId) : super();

  @override
  List<Object?> get props => [mealsId];
}