// Mocks generated by Mockito 5.0.15 from annotations
// in food_topia/test/get_meals_data_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:food_topia/core/error/failures.dart' as _i5;
import 'package:food_topia/domain/entities/meals_data.dart' as _i6;
import 'package:food_topia/domain/repositories/meals_data_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [MealsDataRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMealsDataRepository extends _i1.Mock
    implements _i3.MealsDataRepository {
  MockMealsDataRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.MealsData>> getMealsDataById(
          String? mealsId) =>
      (super.noSuchMethod(Invocation.method(#getMealsDataById, [mealsId]),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.MealsData>>.value(
                  _FakeEither_0<_i5.Failure, _i6.MealsData>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.MealsData>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.MealsData>>> getListMealsData() =>
      (super.noSuchMethod(Invocation.method(#getListMealsData, []),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i6.MealsData>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i6.MealsData>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.MealsData>>>);
  @override
  String toString() => super.toString();
}
