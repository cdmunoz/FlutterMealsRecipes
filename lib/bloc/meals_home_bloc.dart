import 'package:flutter/material.dart';
import 'package:flutter_meal_app/model/models.dart';
import 'package:flutter_meal_app/repository/repositories.dart';

class MealsHomeBloc extends ChangeNotifier {
  final MealsRepository mealsRepository;
  List<Meal> randomMeals = [];
  List<MealCategory> mealCategories = [];
  List<Meal> filteredMeals = [];

  MealsHomeBloc({this.mealsRepository});

  void getRandomMeals() async {
    final _maxRandomMeals = 5;
    List<Meal> _randomMeal = [];
    for (var _indexRandomMeal = 0;
        _indexRandomMeal < _maxRandomMeals;
        _indexRandomMeal++) {
      _randomMeal = await mealsRepository.getRandomMeal();
      randomMeals.add(_randomMeal[0]);
    }
    notifyListeners();
  }

  void getAllMealCategories() async {
    List<MealCategory> _mealCategories = [];
    _mealCategories = await mealsRepository.getAllMealCategories();
    mealCategories.addAll(_mealCategories);
    notifyListeners();
  }

  void filterMealsByName(String mealName) async {
    List<Meal> _searchedMeals =
        await mealsRepository.filterMealsByName(mealName);
    if (_searchedMeals != null && _searchedMeals.isNotEmpty) {
      filteredMeals.addAll(_searchedMeals);
    }
    notifyListeners();
  }
}
