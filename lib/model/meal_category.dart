/// idCategory : "1"
/// strCategory : "Beef"
/// strCategoryThumb : "https://www.themealdb.com/images/category/beef.png"
/// strCategoryDescription : "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"

class MealCategory {
  String _idCategory;
  String _strCategory;
  String _strCategoryThumb;
  String _strCategoryDescription;

  String get idCategory => _idCategory;

  String get strCategory => _strCategory;

  String get strCategoryThumb => _strCategoryThumb;

  String get strCategoryDescription => _strCategoryDescription;

  MealCategory(
      {String idCategory,
      String strCategory,
      String strCategoryThumb,
      String strCategoryDescription}) {
    _idCategory = idCategory;
    _strCategory = strCategory;
    _strCategoryThumb = strCategoryThumb;
    _strCategoryDescription = strCategoryDescription;
  }

  MealCategory.fromJson(dynamic json) {
    _idCategory = json["idCategory"];
    _strCategory = json["strCategory"];
    _strCategoryThumb = json["strCategoryThumb"];
    _strCategoryDescription = json["strCategoryDescription"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["idCategory"] = _idCategory;
    map["strCategory"] = _strCategory;
    map["strCategoryThumb"] = _strCategoryThumb;
    map["strCategoryDescription"] = _strCategoryDescription;
    return map;
  }
}
