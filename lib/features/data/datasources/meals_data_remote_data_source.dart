import 'package:food_topia/features/data/models/meals_data_model.dart';

abstract class MealsDataRemoteDataSource {
  Future<MealsDataModel> getMealsDataById(String id);
  Future<List<MealsDataModel>> getListMealsData();

}