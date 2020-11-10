import 'meal_category.dart';

/// categories : [
///   {"idCategory":"1",
///   "strCategory":"Beef",
///   "strCategoryThumb":"https://www.themealdb.com/images/category/beef.png",
///   "strCategoryDescription":"Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"
///   }]

class MealCategoriesResponse {
  List<MealCategory> _categories;

  List<MealCategory> get categories => _categories;

  MealCategoriesResponse({List<MealCategory> categories}) {
    _categories = categories;
  }

  MealCategoriesResponse.fromJson(dynamic json) {
    if (json["categories"] != null) {
      _categories = [];
      json["categories"].forEach((v) {
        _categories.add(MealCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_categories != null) {
      map["categories"] = _categories.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
