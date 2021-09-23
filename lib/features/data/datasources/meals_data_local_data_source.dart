import 'package:food_topia/features/data/models/meals_data_model.dart';
import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'meals_data_local_data_source.g.dart';

class Meals extends Table {
  TextColumn get mealsId => text().withLength(min: 1, max: 32)();

  TextColumn get mealsName => text().withLength(min: 1, max: 100)();

  TextColumn get mealsPictURL => text().withLength(min: 1, max: 1000)();

  TextColumn get mealsTags =>
      text().withLength(min: 0, max: 100).withDefault(const Constant(""))();

  TextColumn get mealsDesc =>
      text().withLength(min: 0, max: 9999).withDefault(const Constant(""))();

  IntColumn get mealsFavourite => integer().withDefault(const Constant(0))();

  @override
  Set<Column>? get primaryKey => {
    mealsId
  };
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

@UseMoor(tables: [Meals])
class FoodtopiaDatabase extends _$FoodtopiaDatabase {
  // we tell the database where to store the data with this constructor
  FoodtopiaDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 7;

  Future<List<Meal>> getAllMeals() => select(meals).get();

  Future<List<Meal>> getMealsById(String id) async {
    late List<Meal> data;
    data = await (select(meals)..where((tbl) => tbl.mealsId.equals(id))).get().then((value) {
      print("Data return "+value[0].mealsName);
      return value;
    });
    return data;
  }


  Future<List<Meal>> limitMeals(String id) {
    return ((select(meals)..where((tbl) => tbl.mealsId.equals(id)))).get();
  }

  Future updateMealsWithoutFavorites(Meal entry) {
    return (update(meals)..where((tbl) => tbl.mealsId.equals(entry.mealsId)))
        .write(MealsCompanion(
            mealsId: Value(entry.mealsId),
            mealsName: Value(entry.mealsName),
            mealsPictURL: Value(entry.mealsPictURL),
            mealsTags: Value(entry.mealsTags),
            mealsDesc: Value(entry.mealsDesc)));
  }

  Future updateMeals(Meal entry) {
    return (update(meals)..where((tbl) => tbl.mealsId.equals(entry.mealsId)))
        .write(MealsCompanion(mealsFavourite: Value(entry.mealsFavourite))).then((value) => print(value));
  }

  Future upsert(Meal entry){
    return into(meals).insertOnConflictUpdate(entry);
  }

  Future deleteMeals(Meal entry) {
    return delete(meals).delete(entry);
  }

  Future addMeals(Meal entry) {
    return into(meals).insert(entry);
  }
}

abstract class MealsDataLocalDataSource {
  Future<List<MealsDataModel>> getListMealsData();

  Future<MealsDataModel> getMealsDataById(String id);

  Future<List<MealsDataModel>> cacheListMealsData(
      List<MealsDataModel> listMealsDataToCache);

  Future<MealsDataModel> updateMealsData(MealsDataModel mealsDataToCache);

  Future<MealsDataModel> updateMealsDataWithoutFavourite(MealsDataModel mealsDataToCache);

  Future<List<MealsDataModel>> cacheListMealsDataWithoutFavorites(
      List<MealsDataModel> listMealsDataToCache);

  Future<int> getFavById(String id);
}
