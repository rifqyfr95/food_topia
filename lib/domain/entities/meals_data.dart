import 'package:equatable/equatable.dart';

class MealsData extends Equatable {
   String mealsId = "";
   String mealsName = "";
   String mealsPictURL = "";
   String mealsTags = "";
   String mealsInstructions = "";

  MealsData({
    required this.mealsId,
    required this.mealsName,
    required this.mealsPictURL,
    required this.mealsTags,
    required this.mealsInstructions,
  });

  @override
  List<Object?> get props => List<MealsData>.empty();

}