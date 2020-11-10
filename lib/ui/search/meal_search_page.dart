import 'package:flutter/material.dart';
import 'package:flutter_meal_app/other/constants.dart';
import 'package:flutter_meal_app/ui/home/meals_search_box.dart';

class MealSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: TextField(
              style: TextStyle(
                color: Colors.grey,
              ),
              decoration: InputDecoration(
                hintText: "Search Your Meal Recipe...",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(textBoxBorderRadiusValue),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(textBoxBorderRadiusValue),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
                filled: true,
                fillColor: Colors.black26,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
