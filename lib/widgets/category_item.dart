import 'package:flutter/material.dart';
import 'package:my_meal/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  void showMealScreen(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CategoryMealScreen(title: title, id: id);
    }));
  }

  CategoryItem(this.title, this.id, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showMealScreen(context),
      borderRadius: BorderRadius.circular(20),
      splashColor: Colors.amber,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
