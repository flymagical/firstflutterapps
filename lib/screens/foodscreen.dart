import 'package:flutter/material.dart';
import 'package:flutter_apps/models/model_foods.dart';
import 'package:flutter_apps/screens/ui/ui_food.dart';

class Foods extends StatelessWidget {
  UIFoods uiFoods = UIFoods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foods Grid"),
        
      ),
      body: uiFoods.buildFoodListView(),
    );
  }
}

class FoodDetails extends StatelessWidget {
  UIFoods uiFoods = UIFoods();
  ModelFoods modelFoods;

  FoodDetails({Key key, @required this.modelFoods}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Food Details"),),
      body: uiFoods.buildFoodDetail(modelFoods)
    );
  }
}