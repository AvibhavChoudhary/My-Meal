import 'package:flutter/material.dart';
import 'package:my_meal/dummy_data.dart';
import 'package:my_meal/screens/category_meal_screen.dart';
import 'package:my_meal/screens/filterScreen.dart';
import 'package:my_meal/screens/meal_detail_screen.dart';
import 'package:my_meal/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false
  };

  List<Meal> availableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isFavoriteMeal(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  void _setFilters(Map<String, bool> filters) {
    setState(() {
      _filter = filters;

      availableMeal = DUMMY_MEALS.where((meal) {
        if (_filter["gluten"] && !meal.isGlutenFree) {
          return false;
        }
        if (_filter["lactose"] && !meal.isLactoseFree) {
          return false;
        }
        if (_filter["vegan"] && !meal.isVegan) {
          return false;
        }
        if (_filter["vegetarian"] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Meals",
      routes: {
        "/": (ctx) => TabScreen(_favoriteMeals),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(availableMeal),
        MealDetail.routeName: (ctx) =>
            MealDetail(_toggleFavorite, isFavoriteMeal),
        FilterScreen.routeName: (ctx) => FilterScreen(_setFilters, _filter),
      },
      theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.amberAccent,
          fontFamily: "Raleway",
          // canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RobotoCondensed"))),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Meals"),
      ),
      body: Center(
        child: Text("My meals app"),
      ),
    );
  }
}
