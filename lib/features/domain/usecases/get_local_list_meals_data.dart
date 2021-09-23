import 'package:food_topia/features/domain/repositories/meals_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_topia/core/error/failures.dart';
import 'package:food_topia/features/domain/entities/meals_data.dart';
import 'package:food_topia/core/usecases/usecases.dart';




class GetLocalListMealsData extends UseCase<List<MealsData>, ParamsLocalMealsData> {
  final MealsDataRepository repository;

  GetLocalListMealsData(this.repository);

  @override
  Future<Either<Failure, List<MealsData>>> call(ParamsLocalMealsData params) async {
    return await repository.getLocalListMealsData();
  }
}

class ParamsLocalMealsData extends Equatable {


  ParamsLocalMealsData() : super();

  @override
  List<Object?> get props => [];
}