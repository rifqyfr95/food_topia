import 'package:food_topia/features/domain/repositories/meals_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:food_topia/core/error/failures.dart';
import 'package:food_topia/features/domain/entities/meals_data.dart';
import 'package:food_topia/core/usecases/usecases.dart';



class GetMealsDataById extends UseCase<MealsData, ParamsMealsData> {
  final MealsDataRepository repository;

  GetMealsDataById(this.repository);

  @override
  Future<Either<Failure, MealsData>> call(ParamsMealsData params) async {
    return await repository.getMealsDataById(params.id);
  }
}

class ParamsMealsData extends Equatable {

  final String id;

  ParamsMealsData({required this.id}) : super();

  @override
  List<Object?> get props => [id];
}