import 'package:flutter/material.dart';
import 'package:my_meal/dummy_data.dart';

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
            return Text(categoryMeals[index].title);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
