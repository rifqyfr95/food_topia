import 'package:food_topia/data/models/meals_data_model.dart';
import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:sqlite3/sqlite3.dart';

part 'meals_data_local_data_source.g.dart';

class Meals extends Table {
  TextColumn get mealsId => text().withLength(min: 1, max: 32)();

  TextColumn get mealsName => text().withLength(min: 1, max: 100)();

  TextColumn get mealsPictURL => text().withLength(min: 1, max: 1000)();

  TextColumn get mealsTags => text().withLength(min: 1, max: 100)();

  TextColumn get mealsDesc => text().withLength(min: 1, max: 1000)();
}

class FavoriteMeals extends Table {
  TextColumn get mealsId => text().withLength(min: 1, max: 32)();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Meals, FavoriteMeals])
class FoodtopiaDatabase extends _$FoodtopiaDatabase {
  // we tell the database where to store the data with this constructor
  FoodtopiaDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  Future<List<Meal>> getAllMeals() => select(meals).get();

  Future<List<Meal>> getMealsById(String id) =>
      (select(meals)..where((tbl) => tbl.mealsId.equals(id))).get();

  Future<List<Meal>> limitMeals(int limit, {int offset = 0}) {
    return (select(meals)..limit(limit, offset: offset)).get();
  }

  Future updateMeals(Meal entry) {
    return update(meals).replace(entry);
  }

  Future deleteMeals(Meal entry) {
    return delete(meals).delete(entry);
  }

  Future addMeals(Meal entry) {
    return into(meals).insert(entry);
  }

  Future<List<FavoriteMeal>> getAllFavoriteMeals() =>
      select(favoriteMeals).get();

  Future<List<FavoriteMeal>> limitFavoriteMeals(int limit, {int offset = 0}) {
    return (select(favoriteMeals)..limit(limit, offset: offset)).get();
  }

  Future updatFavoriteeMeals(FavoriteMeal entry) {
    return update(favoriteMeals).replace(entry);
  }

  Future deleteFavoriteMeals(FavoriteMeal entry) {
    return delete(favoriteMeals).delete(entry);
  }

  Future addFavoriteMeals(FavoriteMeal entry) {
    return into(favoriteMeals).insert(entry);
  }

  Future<List<FavoriteMeal>> getFavoritesMealsById(String id) =>
      (select(favoriteMeals)..where((tbl) => tbl.mealsId.equals(id))).get();
}

abstract class MealsDataLocalDataSource {
  Future<List<MealsDataModel>> getListMealsData() async {
    late List<MealsDataModel> meals = [];
    List<Meal> mealsData = await FoodtopiaDatabase().getAllMeals();
    if (mealsData.isNotEmpty) {
      mealsData.forEach((element) {
        meals.add(MealsDataModel(
            mealsId: element.mealsId,
            mealsName: element.mealsName,
            mealsPictURL: element.mealsPictURL,
            mealsTags: element.mealsTags,
            mealsInstructions: element.mealsDesc));
      });
    }
    return meals;
  }

  Future<List<MealsDataModel>> getFavoriteMealsData() async {
    late List<MealsDataModel> meals = [];
    List<FavoriteMeal> mealsData =
        await FoodtopiaDatabase().getAllFavoriteMeals();
    if (mealsData.isNotEmpty) {
      mealsData.forEach((element) {
        meals.add(MealsDataModel(
            mealsId: element.mealsId,
            mealsName: "",
            mealsPictURL: "",
            mealsTags: "",
            mealsInstructions: ""));
      });
    }
    return meals;
  }

  Future<MealsDataModel> getMealsDataById(String id) async {
    late MealsDataModel meals;
    List<Meal> mealsData = await FoodtopiaDatabase().getMealsById(id);
    if (mealsData.isNotEmpty) {
      meals = MealsDataModel(
          mealsId: mealsData[0].mealsId,
          mealsName: mealsData[0].mealsName,
          mealsPictURL: mealsData[0].mealsPictURL,
          mealsTags: mealsData[0].mealsTags,
          mealsInstructions: mealsData[0].mealsDesc);
    } else {
      meals = MealsDataModel(
          mealsId: "",
          mealsName: "",
          mealsPictURL: "",
          mealsTags: "",
          mealsInstructions: "");
    }
    return meals;
  }

  Future<MealsDataModel> getFavoriteMealsDataById(String id) async {
    late MealsDataModel meals;
    List<FavoriteMeal> mealsData =
        await FoodtopiaDatabase().getFavoritesMealsById(id);
    if (mealsData.isNotEmpty) {
      meals = MealsDataModel(
          mealsId: mealsData[0].mealsId,
          mealsName: "",
          mealsPictURL: "",
          mealsTags: "",
          mealsInstructions: "");
    } else {
      meals = MealsDataModel(
          mealsId: "",
          mealsName: "",
          mealsPictURL: "",
          mealsTags: "",
          mealsInstructions: "");
    }
    return meals;
  }

  Future<void> cacheMealsData(MealsDataModel mealsDataToCache) async {
    Meal meals = Meal(
        mealsId: mealsDataToCache.mealsId,
        mealsName: mealsDataToCache.mealsName,
        mealsPictURL: mealsDataToCache.mealsPictURL,
        mealsTags: mealsDataToCache.mealsTags,
        mealsDesc: mealsDataToCache.mealsInstructions);
    return await FoodtopiaDatabase().addMeals(meals);
  }

  Future<void> cacheFavoritesMealsData(MealsDataModel mealsDataToCache) async {
    FavoriteMeal meals = FavoriteMeal(mealsId: mealsDataToCache.mealsId);
    return await FoodtopiaDatabase().addFavoriteMeals(meals);
  }

  Future<void> cacheListMealsData(
      List<MealsDataModel> listMealsDataToCache) async {
    listMealsDataToCache.forEach((element) async {
      Meal meals = Meal(
          mealsId: element.mealsId,
          mealsName: element.mealsName,
          mealsPictURL: element.mealsPictURL,
          mealsTags: element.mealsTags,
          mealsDesc: element.mealsInstructions);
      await FoodtopiaDatabase().addMeals(meals);
    });

    return null;
  }

  Future<void> cacheListFavoritesMealsData(
      List<MealsDataModel> listMealsDataToCache) async {
    listMealsDataToCache.forEach((element) async {
      FavoriteMeal meals = FavoriteMeal(
        mealsId: element.mealsId,
      );
      await FoodtopiaDatabase().addFavoriteMeals(meals);
    });

    return null;
  }
}
