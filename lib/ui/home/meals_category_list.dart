import 'package:flutter/material.dart';
import 'package:flutter_meal_app/bloc/meals_home_bloc.dart';
import 'package:flutter_meal_app/other/constants.dart';
import 'package:shimmer/shimmer.dart';

import 'meal_category_item.dart';

class MealsCategoryList extends StatelessWidget {
  const MealsCategoryList({
    Key key,
    @required MealsHomeBloc mealsHomeBloc,
  })  : _mealsHomeBloc = mealsHomeBloc,
        super(key: key);

  final MealsHomeBloc _mealsHomeBloc;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: AnimatedBuilder(
            animation: _mealsHomeBloc,
            builder: (context, child) {
              final _mealCategoriesSize = _mealsHomeBloc.mealCategories.length;
              if (_mealCategoriesSize == 0) {
                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) => Shimmer.fromColors(
                    baseColor: shimmerBaseColor,
                    highlightColor: shimmerHighlightColor,
                    child: MealCategoryItem(),
                  ),
                );
              }
              return GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _mealCategoriesSize,
                itemBuilder: (context, index) => MealCategoryItem(
                  mealCategory: _mealsHomeBloc.mealCategories[index],
                  mealCategories: _mealsHomeBloc.mealCategories,
                  mealsRepository: _mealsHomeBloc.mealsRepository,
                ),
              );
            }),
      ),
    );
  }
}
