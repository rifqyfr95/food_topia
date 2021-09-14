import 'package:connectivity/connectivity.dart';
import 'package:food_topia/core/platform/network_info.dart';
import 'package:food_topia/core/util/string_checker.dart';
import 'package:food_topia/data/datasources/meals_data_local_data_source.dart';
import 'package:food_topia/data/datasources/meals_data_remote_data_source.dart';
import 'package:food_topia/data/datasources/meals_data_remote_data_source_impl.dart';
import 'package:food_topia/data/datasources/meals_data_local_data_source_impl.dart';
import 'package:food_topia/data/repositories/meals_data_repository_impl.dart';
import 'package:food_topia/domain/repositories/meals_data_repository.dart';
import 'package:food_topia/domain/usecases/get_meals_data.dart';
import 'package:food_topia/domain/usecases/get_meals_data_by_id.dart';
import 'package:get_it/get_it.dart';
import 'presentation/bloc/meals_data_bloc.dart';
import 'package:dio/dio.dart';


final sl = GetIt.instance;
final db = FoodtopiaDatabase();

Future<void> init() async {
  sl.registerFactory(() => MealsDataBloc(sl(), sl(), sl(), sl()));
  sl.registerLazySingleton(() => GetMealsDataById(sl()));
  sl.registerLazySingleton(() => GetMealsData(sl()));
  sl.registerLazySingleton(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<MealsDataRepository>(
        () => MealsDataRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<MealsDataLocalDataSource>(
        () => MealsDataLocalDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<MealsDataRemoteDataSource>(
        () => MealsDataRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  final dio = Dio();
  final networkInfo = Connectivity();
  sl.registerLazySingleton(() => db);
  sl.registerLazySingleton(() => dio);
  sl.registerLazySingleton(() => networkInfo);

}