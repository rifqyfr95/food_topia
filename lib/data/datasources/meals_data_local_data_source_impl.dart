import 'package:food_topia/data/datasources/meals_data_local_data_source.dart';
import 'package:food_topia/data/models/meals_data_model.dart';
import 'package:food_topia/injection_container.dart' as di;

class MealsDataLocalDataSourceImpl implements MealsDataLocalDataSource {
  var db = di.db;

  MealsDataLocalDataSourceImpl(this.db);

  Future<List<MealsDataModel>> getListMealsData() async {
    late List<MealsDataModel> meals = [];
    List<Meal> mealsData = await db.getAllMeals();
    if (mealsData.isNotEmpty) {
      mealsData.forEach((element) {
        meals.add(MealsDataModel(
            mealsId: element.mealsId,
            mealsName: element.mealsName,
            mealsPictURL: element.mealsPictURL,
            mealsTags: element.mealsTags,
            mealsInstructions: element.mealsDesc,
            mealsFavourite: element.mealsFavourite));
      });
    }
    return meals;
  }


  Future<MealsDataModel> getMealsDataById(String id) async {
    late MealsDataModel meals;
    List<Meal> mealsData = await db.getMealsById(id);
    if (mealsData.isNotEmpty) {
      meals = MealsDataModel(
          mealsId: mealsData[0].mealsId,
          mealsName: mealsData[0].mealsName,
          mealsPictURL: mealsData[0].mealsPictURL,
          mealsTags: mealsData[0].mealsTags,
          mealsInstructions: mealsData[0].mealsDesc,
          mealsFavourite: mealsData[0].mealsFavourite);
    } else {
      meals = MealsDataModel(
          mealsId: "",
          mealsName: "",
          mealsPictURL: "",
          mealsTags: "",
          mealsInstructions: "",
          mealsFavourite: 0
      );
    }
    return meals;
  }

  Future<void> cacheMealsData(MealsDataModel mealsDataToCache) async {
    Meal meals = Meal(
        mealsId: mealsDataToCache.mealsId,
        mealsName: mealsDataToCache.mealsName,
        mealsPictURL: mealsDataToCache.mealsPictURL,
        mealsTags: mealsDataToCache.mealsTags,
        mealsDesc: mealsDataToCache.mealsInstructions,
        mealsFavourite: mealsDataToCache.mealsFavourite);
    return await db.addMeals(meals);
  }

  Future<void> cacheListMealsData(
      List<MealsDataModel> listMealsDataToCache) async {
    listMealsDataToCache.forEach((element) async {
      Meal meals = Meal(
          mealsId: element.mealsId,
          mealsName: element.mealsName,
          mealsPictURL: element.mealsPictURL,
          mealsTags: element.mealsTags,
          mealsDesc: element.mealsInstructions,
          mealsFavourite: element.mealsFavourite);
      await db.addMeals(meals);
    });

    return null;
  }
}
