import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context).settings.arguments as Category;
    final _cateryMeals = DUMMY_MEALS.where((meal) {
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
          return Text(_cateryMeals[index].title);
        }),
      ),
    );
  }
}