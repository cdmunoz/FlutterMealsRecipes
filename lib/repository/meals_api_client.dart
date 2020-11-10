import 'dart:convert';

import 'package:flutter_meal_app/model/models.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class MealsApiClient {
  final baseUrl = "https://www.themealdb.com/api/json/v1/1/";
  final http.Client httpClient;

  MealsApiClient({@required this.httpClient});

  //returns a list of one meal
  Future<List<Meal>> getRandomMeal() async {
    final url = "$baseUrl/random.php";
    final response = await this.httpClient.get(url);

    if(response.statusCode != 200) {
      throw new Exception("Error getting random meal");
    }

    final json = jsonDecode(response.body);
    return MealsResponse.fromJson(json).meals;
  }

  //returns all meal categories
  Future<List<MealCategory>> getAllMealCategories() async {
    final url = "$baseUrl/categories.php";
    final response =  await this.httpClient.get(url);

    if(response.statusCode != 200) {
      throw new Exception("Error getting meal categories");
    }

    final json = jsonDecode(response.body);
    return MealCategoriesResponse.fromJson(json).categories;
  }

  //returns all meals filtered by category
  Future<List<Meal>> getMealsFilteredByCategory(String strCategory) async {
    final url = "$baseUrl/filter.php?c=$strCategory";
    final response =  await this.httpClient.get(url);

    if(response.statusCode != 200) {
      throw new Exception("Error getting meals by category $strCategory");
    }

    final json = jsonDecode(response.body);
    return MealsResponse.fromJson(json).meals;
  }

  //returns a meal by its id
  Future<List<Meal>> getMealById(String idMeal) async {
    final url = "$baseUrl/lookup.php?i=$idMeal";
    final response =  await this.httpClient.get(url);

    if(response.statusCode != 200) {
      throw new Exception("Error getting meal by its id $idMeal");
    }

    final json = jsonDecode(response.body);
    return MealsResponse.fromJson(json).meals;
  }

  //search meals by name
  Future<List<Meal>> filterMealsByName(String mealName) async {
    final url = "$baseUrl/search.php?s=$mealName";
    final response =  await this.httpClient.get(url);

    if(response.statusCode != 200) {
      throw new Exception("Error searching meal by name: $mealName");
    }

    final json = jsonDecode(response.body);
    return MealsResponse.fromJson(json).meals;
  }

}
