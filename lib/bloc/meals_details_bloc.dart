import 'package:flutter/material.dart';
import 'package:flutter_meal_app/model/models.dart';
import 'package:flutter_meal_app/repository/repositories.dart';

class MealsDetailsBloc extends ChangeNotifier {
  final MealsRepository mealsRepository;
  Meal mealById;

  MealsDetailsBloc({this.mealsRepository});

  void getMealById(String idMeal) async {
    List<Meal> meal = await mealsRepository
        .getMealById(idMeal); //the endpoint returns a list of one element
    mealById = meal.first;
    notifyListeners();
  }
}
