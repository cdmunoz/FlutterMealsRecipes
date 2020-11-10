import 'package:flutter/material.dart';
import 'package:flutter_meal_app/model/models.dart';
import 'package:flutter_meal_app/other/constants.dart';

class MealDetailsInstructionsSection extends StatelessWidget {
  const MealDetailsInstructionsSection({
    Key key,
    @required Meal meal,
  })  : _meal = meal,
        super(key: key);

  final Meal _meal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
                child: Text(
                  "Instructions",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: subTitleTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                Icons.info_outline_rounded,
                color: primaryColor,
              )
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cardsBorderRadiusValue)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Text(
                _meal.strInstructions,
                style: TextStyle(
                  fontSize: generalTextSize,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
