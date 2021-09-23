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

class UpdateMealsDataForById extends MealsDataEvent {
  final String mealsId;
  final int favourites;

  UpdateMealsDataForById(this.mealsId, this.favourites);

}


class UpdateMealsDataForWithoutFavourites extends MealsDataEvent {

  UpdateMealsDataForWithoutFavourites();

}

class UpdateMealsDataForByIdWithoutFavourites extends MealsDataEvent {
  final String mealsId;

  UpdateMealsDataForByIdWithoutFavourites(this.mealsId);

}


class GetLocalMealsForData extends MealsDataEvent {
  GetLocalMealsForData();


}