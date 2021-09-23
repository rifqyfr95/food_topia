part of 'meals_data_bloc.dart';

abstract class MealsDataState extends Equatable {
  MealsDataState([List props = const <dynamic>[]]) : super();
}

class MealsDataInitial extends MealsDataState {
  @override
  List<Object> get props => [];
}
class Empty extends MealsDataState {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loading extends MealsDataState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loaded extends MealsDataState {
  final MealsData meals;

  Loaded({required this.meals});
  @override
  // TODO: implement props
  List<Object?> get props => [meals];
}

class Updated extends MealsDataState {
  final String meals;

  Updated({required this.meals});
  @override
  // TODO: implement props
  List<Object?> get props => [String];
}

class Saved extends MealsDataState {
  final bool saved;

  Saved({required this.saved});
  @override
  // TODO: implement props
  List<Object?> get props => [saved];
}

class ListLoaded extends MealsDataState {
  final List<MealsData> meals;

  ListLoaded({required this.meals});
  @override
  // TODO: implement props
  List<Object?> get props => [meals];
}

class LocalListLoaded extends MealsDataState {
  final List<MealsData> meals;

  LocalListLoaded({required this.meals});
  @override
  // TODO: implement props
  List<Object?> get props => [meals];
}

class Error extends MealsDataState {
  final String message;

  Error({required this.message}) ;

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}