import 'package:flutter/material.dart';
import 'package:flutter_meal_app/model/models.dart';
import 'package:flutter_meal_app/repository/repositories.dart';

class MealsCategoryBloc extends ChangeNotifier {
  final MealsRepository mealsRepository;
  List<Meal> mealsFilteredByCategory = [];
  List<Meal> favoriteMeals = [];

  MealsCategoryBloc({this.mealsRepository});

  void getMealsFilteredByCategory(String strCategory) async {
    List<Meal> filteredMeals =
        await mealsRepository.getMealsFilteredByCategory(strCategory);
    mealsFilteredByCategory.addAll(filteredMeals);
    notifyListeners();
  }

  void insertNewFavoriteMeal(Meal meal) async {
    mealsRepository.insertNewFavoriteMeal(meal);
  }

  void removeFavoriteMeal(String idMeal) async {
    mealsRepository.removeFavoriteMeal(idMeal);
  }

  void getAllFavoriteMeals() async {
    List<Meal> mealsFavorited = await mealsRepository.getAllFavoriteMeals();
    favoriteMeals.addAll(mealsFavorited);
    notifyListeners();
  }
}
