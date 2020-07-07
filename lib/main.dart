import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screen/categories_meals_screen.dart';
import 'package:meals/screen/meal_details_screen.dart';
import 'package:meals/screen/settings_screen.dart';
import 'package:meals/screen/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

import 'models/meal.dart';
import 'models/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];


  void _filterMeals(Settings settings) {
    setState(() {
      this.settings =settings;
      _availableMeals = DUMMY_MEALS.toList().where((meal) {
        final filterGlutenFree = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLacotose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        //final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGlutenFree &&
            !filterLacotose &&
            !filterVegan;
      });
    });
  }

  void _toggleFavorite(Meal meal){
    setState(() {
      _favoriteMeals.contains(meal) ? _favoriteMeals.remove(meal) :_favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal){
      return _favoriteMeals.contains(meal) ;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lets cook',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
            ),
      ),
      initialRoute: AppRoutes.HOME,
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEALS_DETAILS: (ctx) => MealDetailScreen(_toggleFavorite,_isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings,_filterMeals),
      },
    );
  }
}
