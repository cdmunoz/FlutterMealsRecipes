import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meal_app/model/models.dart';
import 'package:flutter_meal_app/other/constants.dart';

class MealCategoryDescription extends StatelessWidget {
  const MealCategoryDescription({
    Key key,
    @required MealCategory mealCategory,
  })  : _mealCategory = mealCategory,
        super(key: key);

  final MealCategory _mealCategory;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        padding: EdgeInsets.all(12.0),
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              _mealCategory.strCategoryThumb,
            ),
            colorFilter: new ColorFilter.mode(
              primaryColor.withOpacity(0.8),
              BlendMode.dstOut,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.network(
                    _mealCategory.strCategoryThumb,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
            SizedBox(
              width: 24.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: AutoSizeText(
                  _mealCategory.strCategoryDescription,
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: mealCatDescTextSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
