import 'package:flutter/material.dart';
import 'package:my_meal/widgets/category_item.dart';
import 'package:my_meal/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(16),
      children: DUMMY_CATEGORIES
          .map((cate) => CategoryItem(cate.title, cate.id, cate.color))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 2,
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20),
    );
  }
}
