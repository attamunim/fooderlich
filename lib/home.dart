import 'package:flutter/material.dart';
import 'package:fooderlich_recpies/screens/explore_screen.dart';
import 'package:fooderlich_recpies/screens/grocery_screen.dart';
import 'screens/recipes_screen.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    const RecipesScreen(),
    const GroceryScreen(),
    Container(color: Colors.blue),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO 9: Wrap inside a Consumer Widget
    return Consumer<TabManager>(
      builder: (context, tabManager, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Fooderlich',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          body: pages[tabManager.selectedTab],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            currentIndex: tabManager.selectedTab,
            onTap: (index) {
              tabManager.gotoTab(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Recipes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'To Buy',
              ),
            ],
          ),
        );
      },
    );
  }
}
