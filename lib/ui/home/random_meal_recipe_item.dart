import 'package:flutter/material.dart';
import 'package:flutter_meal_app/model/models.dart';
import 'package:flutter_meal_app/other/constants.dart';
import 'package:flutter_meal_app/repository/repositories.dart';
import 'package:flutter_meal_app/ui/details/meal_details_page.dart';

class RandomMealRecipeItem extends StatefulWidget {
  final Meal meal;
  final MealsRepository mealsRepository;

  const RandomMealRecipeItem({Key key, this.meal, this.mealsRepository})
      : super(key: key);

  @override
  _RandomMealRecipeItemState createState() => _RandomMealRecipeItemState();
}

class _RandomMealRecipeItemState extends State<RandomMealRecipeItem> {
  void _onTapItem() {
    final _mealDetailsPage = MealDetailsPage(
      meal: widget.meal,
      mealsRepository: widget.mealsRepository,
    );
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => _mealDetailsPage));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardsBorderRadiusValue)),
      child: GestureDetector(
        onTap: _onTapItem,
        child: Stack(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(cardsBorderRadiusValue),
                child: widget.meal != null
                    ? Hero(
                        tag: widget.meal.idMeal,
                        child: Image.network(
                          widget.meal.strMealThumb,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          width: double.infinity,
                        ),
                      )
                    : null,
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(
                left: 8.0,
                bottom: 6.0,
              ),
              child: Text(
                widget.meal != null ? widget.meal?.strMeal : "",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  fontSize: randomMealItemTextSize,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
