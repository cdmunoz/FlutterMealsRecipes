import 'package:flutter/material.dart';
import 'package:flutter_meal_app/bloc/meals_category_bloc.dart';
import 'package:flutter_meal_app/model/models.dart';
import 'package:flutter_meal_app/other/constants.dart';
import 'package:flutter_meal_app/repository/repositories.dart';
import 'package:flutter_meal_app/ui/categories/meal_category_description.dart';
import 'package:flutter_meal_app/ui/categories/meal_category_meals_list.dart';

class MealCategoriesPage extends StatefulWidget {
  final MealsRepository mealsRepository;
  final MealCategory mealCategory;
  final List<MealCategory> mealCategories;

  const MealCategoriesPage(
      {Key key, this.mealCategory, this.mealCategories, this.mealsRepository})
      : super(key: key);

  @override
  _MealCategoriesPageState createState() => _MealCategoriesPageState();
}

class _MealCategoriesPageState extends State<MealCategoriesPage>
    with SingleTickerProviderStateMixin {
  MealCategory _mealCategory;
  MealsCategoryBloc _mealsCategoryBloc;

  @override
  void initState() {
    _mealsCategoryBloc =
        MealsCategoryBloc(mealsRepository: widget.mealsRepository);
    _mealCategory = widget.mealCategory;
    _mealsCategoryBloc.getMealsFilteredByCategory(_mealCategory.strCategory);
    super.initState();
  }

  @override
  void dispose() {
    _mealsCategoryBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                _mealCategory.strCategory,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: bigTitleTextSize,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            MealCategoryDescription(mealCategory: _mealCategory),
            SizedBox(
              height: 12.0,
            ),
            MealCategoryMealsList(
              mealsCategoryBloc: _mealsCategoryBloc,
              mealsRepository: widget.mealsRepository,
            ),
          ],
        ),
      ),
    );
  }
}
