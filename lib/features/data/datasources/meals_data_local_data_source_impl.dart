  import 'package:food_topia/features/data/datasources/meals_data_local_data_source.dart';
import 'package:food_topia/features/data/models/meals_data_model.dart';
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
    var test = await db.getMealsById(id).then((value) {
      print("datas ${value[0].mealsName}");
      if (value.isNotEmpty) {
        print(value[0].mealsName);
        meals = MealsDataModel(
            mealsId: value[0].mealsId,
            mealsName: value[0].mealsName,
            mealsPictURL: value[0].mealsPictURL,
            mealsTags: value[0].mealsTags,
            mealsInstructions: value[0].mealsDesc,
            mealsFavourite: value[0].mealsFavourite);
      } else {
        meals = new MealsDataModel(
            mealsId: "",
            mealsName: "",
            mealsPictURL: "",
            mealsTags: "",
            mealsInstructions: "",
            mealsFavourite: 0);
      }
      print("Data ${meals.mealsName}");
      return meals;
    });
    return test;
  }

  Future<List<MealsDataModel>> cacheListMealsData(
      List<MealsDataModel> listMealsDataToCache) async {
    listMealsDataToCache.forEach((element) async {
      Meal meals = Meal(
          mealsId: element.mealsId,
          mealsName: element.mealsName,
          mealsPictURL: element.mealsPictURL,
          mealsTags: element.mealsTags,
          mealsDesc: element.mealsInstructions,
          mealsFavourite: element.mealsFavourite);
      await db.upsert(meals);
    });

    return listMealsDataToCache;
  }

  @override
  Future<MealsDataModel> updateMealsData(
      MealsDataModel mealsDataToCache) async {
    Meal meals = Meal(
        mealsId: mealsDataToCache.mealsId,
        mealsName: mealsDataToCache.mealsName,
        mealsPictURL: mealsDataToCache.mealsPictURL,
        mealsTags: mealsDataToCache.mealsTags,
        mealsDesc: mealsDataToCache.mealsInstructions,
        mealsFavourite: mealsDataToCache.mealsFavourite);
    await db.updateMeals(meals);
    return mealsDataToCache;
  }

  Future<List<MealsDataModel>> cacheListMealsDataWithoutFavorites(
      List<MealsDataModel> listMealsDataToCache) async {
    listMealsDataToCache.forEach((element) async {
      Meal meals = Meal(
          mealsId: element.mealsId,
          mealsName: element.mealsName,
          mealsPictURL: element.mealsPictURL,
          mealsTags: element.mealsTags,
          mealsDesc: element.mealsInstructions,
          mealsFavourite: 0);
      await db.updateMealsWithoutFavorites(meals);
    });

    return listMealsDataToCache;
  }

  @override
  Future<MealsDataModel> updateMealsDataWithoutFavourite(
      MealsDataModel mealsDataToCache) async {
    Meal meals = Meal(
        mealsId: mealsDataToCache.mealsId,
        mealsName: mealsDataToCache.mealsName,
        mealsPictURL: mealsDataToCache.mealsPictURL,
        mealsTags: mealsDataToCache.mealsTags,
        mealsDesc: mealsDataToCache.mealsInstructions,
        mealsFavourite: 0);
    await db.updateMealsWithoutFavorites(meals);
    return mealsDataToCache;
  }

  @override
  Future<int> getFavById(String id) async {
    int test = 0;
    List<Meal> meals = await db.limitMeals(id);
    test = meals[0].mealsFavourite;
    return test;
  }
}
