import 'package:food_topia/domain/repositories/meals_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_topia/core/error/failures.dart';
import 'package:food_topia/domain/entities/meals_data.dart';
import 'package:food_topia/domain/usecases/usecases.dart';



class GetMealsData extends UseCase<List<MealsData>, ParamsFullMealsData> {
  final MealsDataRepository repository;

  GetMealsData(this.repository);

  @override
  Future<Either<Failure, List<MealsData>>> call(ParamsFullMealsData params) async {
    return await repository.getListMealsData();
  }
}

class ParamsFullMealsData extends Equatable {


  ParamsFullMealsData() : super();

  @override
  List<Object?> get props => [];
}