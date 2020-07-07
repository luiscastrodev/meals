import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/categories_screen.dart';
import 'package:meals/screen/favorite_screen.dart';

class TabsScreen extends StatefulWidget {

    final List<Meal> favoriteMeals ;

    TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  
  int _selectedScreenIndex = 0;
  List<Widget> _screens;

  @override
  void initState(){
    super.initState();
    _screens = [
    CategoriesScreen(),
    FavoriteScreen(widget.favoriteMeals,),
  ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vamos cozinhar?'),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedScreenIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        onTap: _selectScreen,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            title: Text('Categorias'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            title: Text('Favoritos'),
          ),
        ],
      ),
    );
  }
}
