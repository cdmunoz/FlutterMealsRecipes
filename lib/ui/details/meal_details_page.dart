import 'package:flutter/material.dart';
import 'package:flutter_meal_app/bloc/meals_details_bloc.dart';
import 'package:flutter_meal_app/model/models.dart';
import 'package:flutter_meal_app/repository/repositories.dart';
import 'package:flutter_meal_app/ui/details/meal_details_buttons.dart';
import 'package:flutter_meal_app/ui/details/meal_details_category_country_section.dart';
import 'package:flutter_meal_app/ui/details/meal_details_ingredients_measures.dart';
import 'package:flutter_meal_app/ui/details/meal_details_instructions_section.dart';
import 'package:flutter_meal_app/ui/details/meal_details_sliver_appbar.dart';

class MealDetailsPage extends StatefulWidget {
  final Meal meal;
  final MealsRepository mealsRepository;

  const MealDetailsPage({Key key, this.meal, this.mealsRepository})
      : super(key: key);

  @override
  _MealDetailsPageState createState() => _MealDetailsPageState();
}

class _MealDetailsPageState extends State<MealDetailsPage> {
  MealsDetailsBloc _mealsDetailsBloc;

  @override
  void initState() {
    _mealsDetailsBloc =
        MealsDetailsBloc(mealsRepository: widget.mealsRepository);
    _mealsDetailsBloc.getMealById(widget.meal.idMeal);
    super.initState();
  }

  @override
  void dispose() {
    _mealsDetailsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: _mealsDetailsBloc,
          builder: (context, child) {
            final _mealWithDetails = _mealsDetailsBloc.mealById;
            return NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  MealDetailsSliverAppBar(meal: widget.meal),
                  //uses the from argument to leverage Hero
                ];
              },
              body: _mealWithDetails == null
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          MealDetailsCategoryCountrySection(
                              meal: _mealWithDetails),
                          SizedBox(
                            height: 20.0,
                          ),
                          MealDetailsInstructionsSection(
                              meal: _mealWithDetails),
                          SizedBox(
                            height: 8.0,
                          ),
                          MealDetailsIngredientsMeasures(
                              meal: _mealWithDetails),
                          SizedBox(
                            height: 8.0,
                          ),
                          MealDetailsButtons(meal: _mealWithDetails),
                        ],
                      ),
                    ),
            );
          }),
    );
  }
}
