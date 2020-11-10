import 'package:flutter/material.dart';
import 'package:flutter_meal_app/model/models.dart';
import 'package:flutter_meal_app/other/constants.dart';
import 'package:flutter_meal_app/repository/repositories.dart';
import 'package:flutter_meal_app/ui/categories/meal_categories_page.dart';

class MealCategoryItem extends StatefulWidget {
  final MealCategory mealCategory;
  final List<MealCategory> mealCategories;
  final MealsRepository mealsRepository;

  const MealCategoryItem({Key key, this.mealCategory, this.mealCategories, this.mealsRepository})
      : super(key: key);

  @override
  _MealCategoryItemState createState() => _MealCategoryItemState();
}

class _MealCategoryItemState extends State<MealCategoryItem> {
  void _onTapItem() {
    final _mealCategoriesPage = MealCategoriesPage(
      mealCategory: widget.mealCategory,
      mealCategories: widget.mealCategories,
      mealsRepository: widget.mealsRepository,
    );
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => _mealCategoriesPage));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTapItem,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardsBorderRadiusValue)),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(cardsBorderRadiusValue),
                  image: widget.mealCategory != null
                      ? DecorationImage(
                          image: NetworkImage(
                              widget.mealCategory.strCategoryThumb),
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                        )
                      : null,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(
                  left: 8.0,
                  bottom: 6.0,
                ),
                child: Center(
                  child: Text(
                    widget.mealCategory != null
                        ? widget.mealCategory.strCategory
                        : "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      fontSize: mealItemTextSize,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
