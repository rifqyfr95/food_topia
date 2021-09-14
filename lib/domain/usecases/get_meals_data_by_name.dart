import 'package:food_topia/domain/repositories/meals_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:food_topia/core/error/failures.dart';
import 'package:food_topia/domain/entities/meals_data.dart';
import 'package:food_topia/domain/usecases/usecases.dart';



class GetMealsDataById extends UseCase<MealsData, Params> {
  final MealsDataRepository repository;

  GetMealsDataById(this.repository);

  Future<Either<Failure, MealsData>> execute({
    required String id,
  }) async {
    return await repository.getMealsDataById(id);
  }
  @override
  Future<Either<Failure, MealsData>> call(Params params) async {
    return await repository.getMealsDataById(params.id);
  }
}

class Params extends Equatable {

  final String id;

  Params({required this.id}) : super();

  @override
  List<Object?> get props => [id];
}