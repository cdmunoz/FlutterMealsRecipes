import 'package:flutter/material.dart';
import 'package:flutter_meal_app/bloc/meals_home_bloc.dart';
import 'package:flutter_meal_app/model/models.dart';
import 'package:flutter_meal_app/other/constants.dart';
import 'package:flutter_meal_app/repository/repositories.dart';
import 'package:flutter_meal_app/ui/details/meal_details_page.dart';

class MealsSearchBox extends StatelessWidget {
  const MealsSearchBox({
    Key key,
    @required MealsHomeBloc mealsHomeBloc,
    @required MealsRepository mealsRepository,
  })  : _mealsHomeBloc = mealsHomeBloc,
        _mealsRepository = mealsRepository,
        super(key: key);

  final MealsHomeBloc _mealsHomeBloc;
  final MealsRepository _mealsRepository;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: TextField(
        readOnly: true,
        onTap: () {
          showSearch(
            context: context,
            delegate: MealRecipeSearch(_mealsHomeBloc, _mealsRepository),
          );
        },
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
    );
  }
}

class MealRecipeSearch extends SearchDelegate<Meal> {
  final MealsHomeBloc _mealsHomeBloc;
  final MealsRepository _mealsRepository;

  MealRecipeSearch(this._mealsHomeBloc, this._mealsRepository);

  void _clearQueryResults() {
    _mealsHomeBloc.filteredMeals = [];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context).copyWith(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: whiteColor,
          fontSize: searchBoxTextSize,
        ),
      ),
    );
    assert(theme != null);
    return theme;
  }

  @override
  String get searchFieldLabel => 'Search Your Meal Recipe...';

  @override
  TextStyle get searchFieldStyle => TextStyle(
        color: whiteColor,
        fontSize: searchBoxTextSize,
      );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          _clearQueryResults();
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _SearchTextMessage(
            textMessage: "Search term must be longer than two letters.",
          ),
        ],
      );
    } else {
      _clearQueryResults();
      _mealsHomeBloc.filterMealsByName(query);
    }
    return AnimatedBuilder(
      animation: _mealsHomeBloc,
      builder: (context, child) {
        final _listSize = _mealsHomeBloc.filteredMeals.length;
        return _listSize == 0
            ? _SearchTextMessage(textMessage: "No results found ...")
            : Padding(
                padding: EdgeInsets.all(12.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final _mealItem = _mealsHomeBloc.filteredMeals[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {
                          if (_listSize == 1) {
                            Navigator.pop(context); //closes search screen
                          }
                          final mealDetailsPage = MealDetailsPage(
                            meal: _mealItem,
                            mealsRepository: _mealsRepository,
                          );
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => mealDetailsPage));
                        },
                        leading: Image.network(
                          _mealItem.strMealThumb,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 6.0),
                              child: Text(_mealItem.strMeal),
                            ),
                            Text(
                              _mealItem.strCategory,
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: _listSize,
                ),
              );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

class _SearchTextMessage extends StatelessWidget {
  final String textMessage;

  const _SearchTextMessage({Key key, this.textMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        textMessage,
        style: TextStyle(
            fontSize: searchResultsMsgTextSize, fontWeight: FontWeight.w700),
      ),
    );
  }
}
