import 'package:flutter/material.dart';
import 'package:flutter_meal_app/bloc/meals_home_bloc.dart';
import 'package:flutter_meal_app/other/constants.dart';
import 'package:flutter_meal_app/repository/repositories.dart';
import 'package:flutter_meal_app/ui/home/meals_search_box.dart';
import 'package:flutter_meal_app/ui/home/random_meals_recipe_list.dart';
import 'meals_category_list.dart';

class MealsHomePage extends StatefulWidget {
  final MealsRepository mealsRepository;

  const MealsHomePage({Key key, this.mealsRepository}) : super(key: key);

  @override
  _MealsHomePageState createState() => _MealsHomePageState();
}

class _MealsHomePageState extends State<MealsHomePage> {
  PageController _pageViewController;
  MealsHomeBloc _mealsHomeBloc;

  @override
  void initState() {
    _pageViewController = PageController(
      initialPage: 0,
      viewportFraction: 0.9,
    );
    _mealsHomeBloc = MealsHomeBloc(mealsRepository: widget.mealsRepository);
    _mealsHomeBloc.getRandomMeals();
    _mealsHomeBloc.getAllMealCategories();
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    _mealsHomeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: primaryColor,
            ),
          ),
          Positioned.fill(
            child: AppBar(
              backgroundColor: transparentColor,
              elevation: 0,
              title: Text(
                "Meals Recipes",
                style: TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.w700,
                  fontSize: bigTitleTextSize,
                ),
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 80.0,
              ),
              //Search Box
              MealsSearchBox(
                  mealsHomeBloc: _mealsHomeBloc,
                  mealsRepository: widget.mealsRepository),
              RandomMealsRecipeList(
                mealsHomeBloc: _mealsHomeBloc,
                pageViewController: _pageViewController,
                mealsRepository: widget.mealsRepository,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                  left: 25.0,
                  right: 25.0,
                  top: 25.0,
                ),
                child: Text(
                  "Meal Categories",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: subTitleTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              MealsCategoryList(mealsHomeBloc: _mealsHomeBloc)
            ],
          )
        ],
      ),
    );
  }
}
