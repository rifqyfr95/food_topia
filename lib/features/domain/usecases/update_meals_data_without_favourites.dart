import 'package:food_topia/features/domain/repositories/meals_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_topia/core/error/failures.dart';
import 'package:food_topia/features/domain/entities/meals_data.dart';
import 'package:food_topia/core/usecases/usecases.dart';



class UpdateMealsDataWithoutFavourites extends UseCase<List<MealsData>, ParamsFullMealsDataWithoutFavourites> {
  final MealsDataRepository repository;

  UpdateMealsDataWithoutFavourites(this.repository);

  @override
  Future<Either<Failure, List<MealsData>>> call(ParamsFullMealsDataWithoutFavourites params) async {
    return await repository.updateListDataWithoutFavorite();
  }
}

class ParamsFullMealsDataWithoutFavourites extends Equatable {


  ParamsFullMealsDataWithoutFavourites() : super();

  @override
  List<Object?> get props => [];
}