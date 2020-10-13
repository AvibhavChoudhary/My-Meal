import 'package:flutter/material.dart';
import 'package:my_meal/screens/category_meal_screen.dart';
import 'package:my_meal/screens/category_screen.dart';
import 'package:my_meal/screens/drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filter-screen";
  final Function _setFilter;
  final Map<String, bool> filters;

  FilterScreen(this._setFilter, this.filters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  @override
  initState() {
    super.initState();
    isGlutenFree = widget.filters["gluten"];
    isLactoseFree = widget.filters["lactose"];
    isVegan = widget.filters["vegan"];
    isVegetarian = widget.filters["vegetarian"];
  }

  void filterSaved(Map<String, bool> selectedFilter) {
    widget._setFilter(selectedFilter);
    Navigator.of(context).pushReplacementNamed("/");
  }

  Widget buildListTile(String title, String description, Function updateValue,
      bool currentValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilter = {
                    "gluten": isGlutenFree,
                    "lactose": isLactoseFree,
                    "vegan": isVegan,
                    "vegetarian": isVegetarian
                  };
                  filterSaved(selectedFilter);
                }),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Filter out your meals",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildListTile(
                  "Gluten Free",
                  "It will show up only gluten free items",
                  (val) {
                    setState(() {
                      isGlutenFree = val;
                    });
                  },
                  isGlutenFree,
                ),
                buildListTile(
                  "Lactose Free",
                  "It will show up only lactose free items",
                  (val) {
                    setState(() {
                      isLactoseFree = val;
                    });
                  },
                  isLactoseFree,
                ),
                buildListTile(
                  "Vegan",
                  "It will show up only meals of vegan category",
                  (val) {
                    setState(() {
                      isVegan = val;
                    });
                  },
                  isVegan,
                ),
                buildListTile(
                  "Vegetarian",
                  "It will show up only vegetarian items",
                  (val) {
                    setState(() {
                      isVegetarian = val;
                    });
                  },
                  isVegetarian,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
