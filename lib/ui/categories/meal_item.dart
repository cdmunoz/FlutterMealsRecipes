import 'package:flutter/material.dart';
import 'package:flutter_meal_app/bloc/meals_category_bloc.dart';
import 'package:flutter_meal_app/model/models.dart';
import 'package:flutter_meal_app/other/constants.dart';
import 'package:flutter_meal_app/repository/repositories.dart';
import 'package:flutter_meal_app/ui/details/meal_details_page.dart';

class MealItem extends StatefulWidget {
  final Meal meal;
  final MealsRepository mealsRepository;
  final MealsCategoryBloc mealsCategoryBloc;

  const MealItem(
      {Key key, this.meal, this.mealsRepository, this.mealsCategoryBloc})
      : super(key: key);

  @override
  _MealItemState createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  MealsCategoryBloc _mealsBloc;

  void _onTapItem() {
    final _mealDetailsPage = MealDetailsPage(
      meal: widget.meal,
      mealsRepository: widget.mealsRepository,
    );
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => _mealDetailsPage));
  }

  bool isPressed = false;
  IconData iconData = Icons.favorite_border;

  void _onPressFavIcon() {
    setState(() {
      isPressed = !isPressed;
      if (isPressed) {
        iconData = Icons.favorite;
      } else {
        iconData = Icons.favorite_border;
      }
    });
  }

  @override
  void initState() {
    print("widget.mealsCategoryBloc > ${widget.mealsCategoryBloc}");
    _mealsBloc = widget.mealsCategoryBloc;
    super.initState();
  }

  @override
  void dispose() {
    if (_mealsBloc != null) _mealsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final radiusCircularCard = Radius.circular(cardsBorderRadiusValue);
    return GestureDetector(
      onTap: _onTapItem,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardsBorderRadiusValue)),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    child: widget.meal != null
                        ? Hero(
                            tag: widget.meal.idMeal,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: radiusCircularCard,
                                topRight: radiusCircularCard,
                              ),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.yellowAccent.withOpacity(0.15),
                                    BlendMode.lighten),
                                child: Image.network(
                                  widget.meal != null
                                      ? widget.meal.strMealThumb
                                      : "",
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          )
                        : null,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            widget.meal != null ? widget.meal.strMeal : "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              fontSize: mealItemTextSize,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
