import 'package:equatable/equatable.dart';

class MealsData extends Equatable {
   String mealsId = "";
   String mealsName = "";
   String mealsPictURL = "";
   String mealsTags = "";
   String mealsInstructions = "";
   int mealsFavourite = 0;

  MealsData({
    required this.mealsId,
    required this.mealsName,
    required this.mealsPictURL,
    required this.mealsTags,
    required this.mealsInstructions,
    required int mealsFavourite,
  });

  @override
  List<Object?> get props => List<MealsData>.empty();

}