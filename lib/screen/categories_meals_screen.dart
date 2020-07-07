import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {

  final List<Meal> meals;

  CategoriesMealsScreen(this.meals);

  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context).settings.arguments as Category;
    
    final _cateryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas'),
      ),
      body: Center(
        child:  ListView.builder(
          itemCount: _cateryMeals.length,
          itemBuilder: (ctx,index){
          return MealItem(_cateryMeals[index]);
        }),
      ),
    );
  }
}