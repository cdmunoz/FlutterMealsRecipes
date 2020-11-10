import 'package:flutter/material.dart';
import 'package:flutter_meal_app/bloc/meals_home_bloc.dart';
import 'package:flutter_meal_app/other/constants.dart';
import 'package:flutter_meal_app/repository/repositories.dart';
import 'package:flutter_meal_app/ui/home/random_meal_recipe_item.dart';
import 'package:shimmer/shimmer.dart';

class RandomMealsRecipeList extends StatelessWidget {
  final MealsHomeBloc mealsHomeBloc;
  final PageController pageViewController;
  final MealsRepository mealsRepository;

  const RandomMealsRecipeList(
      {Key key,
      this.mealsHomeBloc,
      this.pageViewController,
      this.mealsRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4.0,
      ),
      height: 130.0,
      child: AnimatedBuilder(
          animation: mealsHomeBloc,
          builder: (context, child) {
            final _randomMealsSize = mealsHomeBloc.randomMeals.length;
            if (_randomMealsSize == 0) {
              return PageView.builder(
                  controller: pageViewController,
                  itemCount: 2,
                  itemBuilder: (context, index) => Shimmer.fromColors(
                        baseColor: shimmerBaseColor,
                        highlightColor: shimmerHighlightColor,
                        child: RandomMealRecipeItem(),
                      ));
            }
            return PageView.builder(
              controller: pageViewController,
              itemCount: _randomMealsSize,
              itemBuilder: (context, index) => RandomMealRecipeItem(
                meal: mealsHomeBloc.randomMeals[index],
                mealsRepository: mealsRepository,
              ),
            );
          }),
    );
  }
}
