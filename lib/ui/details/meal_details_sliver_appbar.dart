import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meal_app/model/models.dart';
import 'package:flutter_meal_app/other/constants.dart';

class MealDetailsSliverAppBar extends StatelessWidget {
  const MealDetailsSliverAppBar({
    Key key,
    @required Meal meal,
  })  : _meal = meal,
        super(key: key);

  final Meal _meal;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.35,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        centerTitle: true,
        title: AutoSizeText(
          _meal.strMeal,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.w700,
            fontSize: bigTitleTextSize,
          ),
        ),
        background: Hero(
          tag: _meal.idMeal,
          child: Image.network(
            _meal.strMealThumb,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
