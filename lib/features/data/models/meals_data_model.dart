import 'package:food_topia/features/domain/entities/meals_data.dart';
import 'package:meta/meta.dart';

class MealsDataModel extends MealsData {
  MealsDataModel(
      {required String mealsId,
      required String mealsName,
      required String mealsPictURL,
      required String mealsTags,
      required String mealsInstructions,
      required int mealsFavourite})
      : super(
            mealsId: mealsId,
            mealsName: mealsName,
            mealsPictURL: mealsPictURL,
            mealsTags: mealsTags,
            mealsInstructions: mealsInstructions,
            mealsFavourite: mealsFavourite);

  factory MealsDataModel.fromJson(Map<String, dynamic> json) {
    return MealsDataModel(
      mealsId: json['idMeal'],
      mealsName: json['strMeal'],
      mealsPictURL: json['strMealThumb'],
      mealsTags: json['strTags'] ?? "",
      mealsInstructions: json['strInstructions'] ?? "",
      mealsFavourite: 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idMeal': mealsId,
      'strMeals': mealsName,
      'strMealThumb': mealsPictURL,
      'strTags': mealsTags,
      'strInstructions': mealsInstructions,
      'idFavorites': mealsFavourite
    };
  }
}
