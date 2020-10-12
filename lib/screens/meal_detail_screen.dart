import 'package:flutter/material.dart';
import 'package:my_meal/dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = "/meal-detail";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == args);

    Widget buildSectionTitle(BuildContext ctx, String title) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(ctx).textTheme.headline6,
        ),
      );
    }

    Widget buildContainer(context, child) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 4,
              color: Colors.amberAccent,
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 300,
        width: MediaQuery.of(context).size.width - 50,
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
                context,
                ListView.builder(
                    itemCount: selectedMeal.ingredients.length,
                    itemBuilder: (ctx, index) => Card(
                          elevation: 4,
                          color: Colors.yellow[100],
                          child: Text(
                            "# ${selectedMeal.ingredients[index]}",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ))),
            buildSectionTitle(context, "Steps"),
            buildContainer(
                context,
                ListView.builder(
                    itemCount: selectedMeal.steps.length,
                    itemBuilder: (ctx, index) => ListTile(
                          leading: CircleAvatar(
                            child: Text("${index + 1}"),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        )))
          ],
        ),
      ),
    );
  }
}
