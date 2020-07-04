import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screen/categories_meals_screen.dart';
import 'package:meals/screen/categories_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed'
          ),
        ),
      ),
      initialRoute: AppRoutes.HOME,
      routes: {
        AppRoutes.HOME : (ctx)=> CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS:(ctx)=>CategoriesMealsScreen(),
      },
    );
  }
}
