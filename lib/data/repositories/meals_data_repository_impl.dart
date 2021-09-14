import 'package:dartz/dartz.dart';
import 'package:food_topia/core/error/exception.dart';

import 'package:food_topia/core/error/failures.dart';
import 'package:food_topia/domain/entities/meals_data.dart';
import 'package:food_topia/domain/repositories/meals_data_repository.dart';
import 'package:food_topia/core/platform/network_info.dart';
import 'package:food_topia/data/datasources/meals_data_remote_data_source.dart';
import 'package:food_topia/data/datasources/meals_data_local_data_source.dart';

class MealsDataRepositoryImpl implements MealsDataRepository {
  final MealsDataRemoteDataSource remoteDataSource;
  final MealsDataLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  MealsDataRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, MealsData>> getMealsDataById(String mealsId) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMealsData =
            await remoteDataSource.getMealsDataById(mealsId);
        localDataSource.cacheMealsData(remoteMealsData);
        return Right(remoteMealsData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      final localMealsData = await localDataSource.getMealsDataById(mealsId);
      return Right(localMealsData);
    }
  }

  @override
  Future<Either<Failure, List<MealsData>>> getListMealsData() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMealsData = await remoteDataSource.getListMealsData();
        localDataSource.cacheListMealsData(remoteMealsData);
        return Right(remoteMealsData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try{
        final localMealsData = await localDataSource.getListMealsData();
        return Right(localMealsData);
      } on CacheException {
        return Left(CacheFailure());
      }

    }
  }

  @override
  Future<Either<Failure, MealsData>> getFavoriteMealsDataById(String mealsId) async {
    try{
      final localMealsData = await localDataSource.getFavoriteMealsDataById(mealsId);
      return Right(localMealsData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<MealsData>>> getListFavoriteMealsData() async {
    try{
      final localMealsData = await localDataSource.getFavoriteMealsData();
      return Right(localMealsData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
