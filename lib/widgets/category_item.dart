import 'package:flutter/material.dart';
import 'package:my_meal/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String id;

  void showMealScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,
        arguments: {"id": id, "title": title});
  }

  CategoryItem(this.title, this.id, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showMealScreen(context),
      borderRadius: BorderRadius.circular(20),
      splashColor: Colors.amber,
      child: Column(
        children: [
          Container(
            height: 200,
            margin: EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width - 100,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    color: Colors.black.withOpacity(0.5),
                    colorBlendMode: BlendMode.darken,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  // bottom: 20,
                  // right: 10,
                  child: Container(
                    width: 200,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30))),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
