import 'package:dartz/dartz.dart';
import 'package:food_topia/core/error/exception.dart';
import 'package:food_topia/core/error/failures.dart';
import 'package:food_topia/features/domain/entities/meals_data.dart';
import 'package:food_topia/features/domain/repositories/meals_data_repository.dart';
import 'package:food_topia/core/platform/network_info.dart';
import 'package:food_topia/features/data/datasources/meals_data_remote_data_source.dart';
import 'package:food_topia/features/data/datasources/meals_data_local_data_source.dart';

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
        print("kesini inet");
        final remoteMealsData =
            await remoteDataSource.getMealsDataById(mealsId);
        var test1 = await localDataSource.updateMealsDataWithoutFavourite(remoteMealsData);
        // var test2 = await localDataSource.getFavById(mealsId);
        // test1.mealsFavourite = test2;
        return Right(test1);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      print("kesini lokal");
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
  Future<Either<Failure, MealsData>> updateMeals(String mealsId, int favorites) async {
    try{
      final remoteMealsData = await remoteDataSource.getMealsDataById(mealsId);
      remoteMealsData.mealsFavourite = favorites;
      localDataSource.updateMealsData(remoteMealsData);
      return Right(remoteMealsData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }



  @override
  Future<Either<Failure, List<MealsData>>> updateListDataWithoutFavorite() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMealsData = await remoteDataSource.getListMealsData();
        final localMealsData = await localDataSource.cacheListMealsDataWithoutFavorites(remoteMealsData);
        return Right(localMealsData);
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
  Future<Either<Failure, MealsData>> updateMealsDataWithoutFavorite(String mealsId) async {
    try{
      final remoteMealsData = await remoteDataSource.getMealsDataById(mealsId);
      localDataSource.updateMealsDataWithoutFavourite(remoteMealsData);
      return Right(remoteMealsData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }




}
