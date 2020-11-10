import 'package:flutter_meal_app/model/models.dart';
import 'package:flutter_meal_app/repository/meals_database.dart';
import 'package:meta/meta.dart';
import 'package:flutter_meal_app/repository/meals_api_client.dart';

class MealsRepository {
  final MealsApiClient mealsApiClient;
  final MealsDatabase mealsDatabase;

  MealsRepository({@required this.mealsApiClient, @required this.mealsDatabase})
      : assert(mealsApiClient != null),
        assert(mealsDatabase != null);

  Future<List<Meal>> getRandomMeal() async {
    return await mealsApiClient.getRandomMeal();
  }

  Future<List<MealCategory>> getAllMealCategories() async {
    return await mealsApiClient.getAllMealCategories();
  }

  Future<List<Meal>> getMealsFilteredByCategory(String strCategory) async {
    return await mealsApiClient.getMealsFilteredByCategory(strCategory);
  }

  Future<List<Meal>> getMealById(String idMeal) async {
    return await mealsApiClient.getMealById(idMeal);
  }

  Future<List<Meal>> filterMealsByName(String mealName) async {
    return await mealsApiClient.filterMealsByName(mealName);
  }

  Future<bool> isFavoriteMeal(String idMeal) async {
    return await mealsDatabase.isFavoriteMeal(idMeal);
  }

  Future<void> insertNewFavoriteMeal(Meal meal) async {
    return await mealsDatabase.insertNewFavoriteMeal(meal);
  }

  Future<void> removeFavoriteMeal(String idMeal) async {
    return await mealsDatabase.removeFavoriteMeal(idMeal);
  }

  Future<List<Meal>> getAllFavoriteMeals() async {
    return await mealsDatabase.getAllFavoriteMeals();
  }
}
