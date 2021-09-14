import 'package:dio/dio.dart';
import 'package:food_topia/data/models/meals_data_model.dart';

abstract class MealsDataRemoteDataSource {
  Future<MealsDataModel> getMealsDataById(String id) async {
    late MealsDataModel result;
    String base_url = "www.themealdb.com/api/json/v1/1/lookup.php?i=${id}";
    var dio = Dio();
    var response = await dio.get(base_url);
    List<dynamic> meals = response.data['meals'];
    meals.forEach((element) {
      result = MealsDataModel(mealsId: element['idMeal'],mealsName: element['strMeal'], mealsPictURL: element['strMealThumb'], mealsTags: element['strTags'] ?? "", mealsInstructions: element['strInstructions']);
    });
    return result;

  }
  Future<List<MealsDataModel>> getListMealsData() async {
    List<MealsDataModel> result = [];
    String base_url = "https://www.themealdb.com/api/json/v1/1/search.php?f=b";
    var dio = Dio();
    var response = await dio.get(base_url);
    List<dynamic> meals = response.data['meals'];
    meals.forEach((element) {
      MealsDataModel mealsData = MealsDataModel(mealsId: element['idMeal'],mealsName: element['strMeal'], mealsPictURL: element['strMealThumb'], mealsTags: element['strTags'] ?? "", mealsInstructions: element['strInstructions']);
      result.add(mealsData);
      if (result.length == 20) {
        return;
      }
    });
    return result;
  }

}