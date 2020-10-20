import 'package:flutter/material.dart';
import 'package:flutter_apps/screens/ui/ui_drink.dart';

class Drinks extends StatelessWidget {
  final UIDrinks uiDrinks = UIDrinks();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drinks List"),
        
      ),
      body: uiDrinks.buildDrinkGridView(),
    );
  }
}