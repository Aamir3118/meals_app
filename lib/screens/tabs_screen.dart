import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/favourites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>>? _pages;
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': CategoryScreen(), 'title': 'Category'},
      {
        'page': FavouritesScreen(widget.favoriteMeals),
        'title': 'Your Favorites'
      }
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(_pages![_selectedPageIndex]['title']),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Theme.of(context).accentColor,
            unselectedItemColor: Colors.white,
            currentIndex: _selectedPageIndex,
            items: const [
              BottomNavigationBarItem(
                label: 'Category',
                icon: Icon(Icons.category),
              ),
              BottomNavigationBarItem(
                label: 'Favorite',
                icon: Icon(Icons.star),
              ),
            ]),
        body: _pages![_selectedPageIndex]['page']);
  }
}
