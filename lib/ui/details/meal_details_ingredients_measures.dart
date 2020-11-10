import 'package:flutter/material.dart';
import 'package:flutter_meal_app/model/models.dart';
import 'package:flutter_meal_app/other/constants.dart';

class MealDetailsIngredientsMeasures extends StatelessWidget {
  const MealDetailsIngredientsMeasures({
    Key key,
    @required Meal meal,
  })  : _meal = meal,
        super(key: key);

  final Meal _meal;

  List<Widget> _getMealIngredientsAndMeasures(Meal meal) {
    List<Widget> _mealIngredients = [];
    _mealIngredients.add(Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      alignment: Alignment.topLeft,
      child: Text(
        "Ingredients",
        style: TextStyle(
          color: primaryColor,
          fontSize: contentTextSize,
          fontWeight: FontWeight.normal,
        ),
      ),
    ));
    _mealIngredients.add(SizedBox(
      height: 12.0,
    ));
    for (var indexIngredient = 0;
        indexIngredient < meal.ingredients.length - 1;
        indexIngredient++) {
      _mealIngredients.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Text(
                "• ${meal.ingredients[indexIngredient]}",
                style: TextStyle(
                  fontSize: generalTextSize,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Text(
                ": ${meal.measures[indexIngredient]}",
                style: TextStyle(
                  fontSize: generalTextSize,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ));
    }
    return _mealIngredients;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardsBorderRadiusValue)),
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Column(
            children: _getMealIngredientsAndMeasures(_meal),
          ),
        ),
      ),
    );
  }
}
