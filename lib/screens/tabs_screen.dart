import 'package:flutter/material.dart';
import 'package:my_meal/screens/category_screen.dart';
import 'package:my_meal/screens/favorites_screem.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> pages = [
    {"page": CategoryScreen(), "title": "Categories"},
    {"page": FavoriteScreen(), "title": "Favorites"}
  ];

  int selectedPageIndex = 0;

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
