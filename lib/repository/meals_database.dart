import 'package:moor_flutter/moor_flutter.dart';
import 'dart:core';
import 'package:flutter_meal_app/model/models.dart';

part 'meals_database.g.dart';

class FavoriteMeal extends Table {
  TextColumn get idMeal => text().named('id_meal')();

  TextColumn get strMeal => text().named('meal_name')();

  TextColumn get strMealThumb => text().named('meal_img')();

  @override
  Set<Column> get primaryKey => {idMeal};
}

@UseMoor(tables: [FavoriteMeal])
class MealsDatabase extends _$MealsDatabase {
  MealsDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<Meal>> getAllFavoriteMeals() => select(favoriteMeal)
      .map((mealData) => Meal(
            idMeal: mealData.idMeal,
            strMeal: mealData.strMeal,
            strMealThumb: mealData.strMealThumb,
          ))
      .get();

  Stream<List<FavoriteMealData>> watchAllFavoriteMeals() =>
      select(favoriteMeal).watch();

  Future<bool> isFavoriteMeal(String idMeal) =>
      (select(favoriteMeal)..where((favMeal) => favMeal.idMeal.equals(idMeal)))
          .get()
          .then((favMealsList) => favMealsList.length >= 1);

  Future<void> insertNewFavoriteMeal(Meal meal) {
    var favMeal = FavoriteMealData(
        idMeal: meal.idMeal,
        strMeal: meal.strMeal,
        strMealThumb: meal.strMealThumb);
    into(favoriteMeal).insert(favMeal);
  }

  Future<void> removeFavoriteMeal(String idMeal) =>
      (delete(favoriteMeal)..where((favMeal) => favMeal.idMeal.equals(idMeal)))
          .go();
}
