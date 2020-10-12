import 'package:flutter/material.dart';
import 'package:my_meal/dummy_data.dart';
import 'package:my_meal/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  final String id;
  final String title;

  CategoryMealScreen({@required this.id, @required this.title});

  @override
  Widget build(BuildContext context) {
    final categoryMeals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(id)).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
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
