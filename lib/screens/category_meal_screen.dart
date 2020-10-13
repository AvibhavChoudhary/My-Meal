import 'package:flutter/material.dart';
import 'package:my_meal/dummy_data.dart';
import 'package:my_meal/models/meal.dart';
import 'package:my_meal/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = "/category-meal-screen";

  final List<Meal> availableMeal;

  CategoryMealScreen(this.availableMeal);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String id;
  String title;
  String categoryTitle;
  List<Meal> categoryMeals;
  var isLoaded = false;

  void removeMeal(String id) {
    setState(() {
      widget.availableMeal.removeWhere((element) => element.id == id);
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   categoryMeals = DUMMY_MEALS
  //       .where((meal) => meal.categories.contains(widget.id))
  //       .toList();
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    id = routeArgs["id"];
    title = routeArgs["title"];
    if (!isLoaded) {
      categoryMeals = widget.availableMeal
          .where((meal) => meal.categories.contains(id))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                removeMealItem: removeMeal,
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                affordability: categoryMeals[index].affordability,
                complexity: categoryMeals[index].complexity,
                duration: categoryMeals[index].duration);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
