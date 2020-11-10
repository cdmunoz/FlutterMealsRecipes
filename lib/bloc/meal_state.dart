import 'package:meta/meta.dart';
import 'package:flutter_meal_app/model/models.dart';

abstract class MealState {
  const MealState();
}

class MealEmpty extends MealState {}

class MealLoading extends MealState {}

class MealLoaded extends MealState {
  final List<Meal> meals;

  MealLoaded({@required this.meals}) : assert(meals != null);
}

class MealError extends MealState {}
