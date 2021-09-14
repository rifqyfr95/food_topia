import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_topia/core/error/failures.dart';
import 'package:food_topia/core/platform/network_info.dart';
import 'package:food_topia/core/util/string_checker.dart';
import 'package:food_topia/domain/entities/meals_data.dart';
import 'package:food_topia/domain/usecases/get_meals_data.dart';
import 'package:food_topia/domain/usecases/get_meals_data_by_id.dart';

part 'meals_data_event.dart';

part 'meals_data_state.dart';

class MealsDataBloc extends Bloc<MealsDataEvent, MealsDataState> {
  final GetMealsDataById getMealsDataById;
  final GetMealsData getMealsData;
  final InputConverter inputConverter;
  final NetworkInfoImpl networkInfo;
  static const String SERVER_FAILURE_MESSAGE = 'Server Failure';
  static const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
  static const String INVALID_INPUT_FAILURE_MESSAGE =
      'Invalid Input - The id must be a number formatted string';

  MealsDataBloc(
      this.getMealsDataById,
      this.getMealsData,
      this.inputConverter,
      this.networkInfo)
      : assert(getMealsDataById != null),
        assert(getMealsData != null),
        assert(networkInfo != null),
        assert(inputConverter != null),
        super(Empty());

  @override
  Stream<MealsDataState> mapEventToState(
    MealsDataEvent event,
  ) async* {
    if (event is GetMealsDataForById) {
      final mealsId = inputConverter.stringChecker(event.mealsId);
      yield* mealsId.fold((failure) async* {
        yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
      }, (meals) async* {
        yield Loading();
        final failureOrMeals =
            await getMealsDataById(ParamsMealsData(id: meals));

        yield* failureOrMeals.fold((failure) async* {
          yield Error(
            message: _mapFailureToMessage(failure),
          );
        }, (r) async* {
          yield Loaded(meals: r);
        });
      });
    }else if (event is GetMealsForData) {
      final mealsId = await networkInfo.connectionCheck();
      yield* mealsId.fold((failure) async* {
        yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
      }, (meals) async* {
        yield Loading();
        final failureOrMeals = await getMealsData(ParamsFullMealsData());
        yield* failureOrMeals.fold((failure) async* {
          yield Error(
            message: _mapFailureToMessage(failure),
          );
        }, (r) async* {
          yield ListLoaded(meals: r);
        });
      });
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
