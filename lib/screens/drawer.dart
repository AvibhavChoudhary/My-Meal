import 'package:flutter/material.dart';
import 'package:my_meal/screens/filterScreen.dart';

class MyDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon, String title, Function drawerHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 26,
            fontWeight: FontWeight.bold),
      ),
      onTap: drawerHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20),
          buildListTile(Icons.restaurant, "Meals",
              () => Navigator.of(context).pushReplacementNamed("/")),
          buildListTile(
              Icons.settings,
              "Setting",
              () => Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName)),
        ],
      ),
    );
  }
}
