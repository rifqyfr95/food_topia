part of 'meals_data_bloc.dart';

abstract class MealsDataEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class GetMealsDataForById extends MealsDataEvent {
  final String mealsId;

  GetMealsDataForById(this.mealsId);

}

class GetMealsForData extends MealsDataEvent {
  GetMealsForData();


}
