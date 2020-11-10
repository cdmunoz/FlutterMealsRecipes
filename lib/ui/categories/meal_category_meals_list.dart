import 'package:flutter/material.dart';
import 'package:flutter_meal_app/bloc/meals_category_bloc.dart';
import 'package:flutter_meal_app/other/constants.dart';
import 'package:flutter_meal_app/repository/repositories.dart';
import 'package:shimmer/shimmer.dart';

import 'meal_item.dart';

class MealCategoryMealsList extends StatelessWidget {
  const MealCategoryMealsList({
    Key key,
    @required MealsCategoryBloc mealsCategoryBloc,
    @required MealsRepository mealsRepository,
  })  : _mealsCategoryBloc = mealsCategoryBloc,
        _mealsRepository = mealsRepository,
        super(key: key);

  final MealsCategoryBloc _mealsCategoryBloc;
  final MealsRepository _mealsRepository;

  @override
  Widget build(BuildContext context) {
    print("_mealsCategoryBloc in Meals List >>>> $_mealsCategoryBloc");
    return Expanded(
      child: AnimatedBuilder(
          animation: _mealsCategoryBloc,
          builder: (context, child) {
            final _mealsSize =
                _mealsCategoryBloc.mealsFilteredByCategory.length;
            if (_mealsSize == 0) {
              return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) => Shimmer.fromColors(
                        baseColor: shimmerBaseColor,
                        highlightColor: shimmerHighlightColor,
                        child: MealItem(),
                      ));
            }
            return GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: _mealsSize,
              itemBuilder: (context, index) => MealItem(
                meal: _mealsCategoryBloc.mealsFilteredByCategory[index],
                mealsRepository: _mealsRepository,
                mealsCategoryBloc: _mealsCategoryBloc,
              ),
            );
          }),
    );
  }
}
