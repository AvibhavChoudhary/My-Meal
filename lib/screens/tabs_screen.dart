import 'package:flutter/material.dart';
import 'package:my_meal/models/meal.dart';
import 'package:my_meal/screens/category_screen.dart';
import 'package:my_meal/screens/drawer.dart';
import 'package:my_meal/screens/favorites_screem.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> _favoriteMeals;

  TabScreen(this._favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> pages;
  int selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pages = [
      {"page": CategoryScreen(), "title": "Categories"},
      {"page": FavoriteScreen(widget._favoriteMeals), "title": "Favorites"}
    ];
  }

  void selectedPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]["title"]),
      ),
      drawer: MyDrawer(),
      body: pages[selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectedPage,
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: "Categories"),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              label: "Favorites")
        ],
      ),
    );
  }
}
