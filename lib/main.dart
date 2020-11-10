import 'package:flutter/material.dart';
import 'package:flutter_meal_app/other/constants.dart';
import 'package:flutter_meal_app/repository/meals_api_client.dart';
import 'package:flutter_meal_app/repository/meals_database.dart';
import 'package:flutter_meal_app/repository/repositories.dart';
import 'package:flutter_meal_app/ui/home/meals_home_page.dart';
import 'package:http/http.dart' as http;

void main() {
  final _mealsRepository = MealsRepository(
      mealsApiClient: MealsApiClient(httpClient: http.Client()),
      mealsDatabase: MealsDatabase());
  runApp(MealsRecipesApp(
    mealsRepository: _mealsRepository,
  ));
}

class MealsRecipesApp extends StatelessWidget {
  final MealsRepository mealsRepository;

  const MealsRecipesApp({Key key, this.mealsRepository})
      : assert(mealsRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals Recipes',
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
      ),
      home: MealsHomePage(
        mealsRepository: mealsRepository,
      ),
    );
  }
}
