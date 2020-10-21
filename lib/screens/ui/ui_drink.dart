import 'package:flutter/material.dart';
import 'package:flutter_apps/data/data_foods.dart';
import 'package:flutter_apps/models/model_foods.dart';
import 'package:flutter_apps/screens/foodscreen.dart';

class UIDrinks{
  Widget buildDrinkGridView(){
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2),
        itemCount: DataFoods.itemFoodNums, 
        itemBuilder: (context, index){
          ModelFoods modelFoods = DataFoods.getItemFoods(index);
          return InkWell(
            splashColor: Colors.red,
            onTap: (){
                // Navigator.push(
                // context, 
                // MaterialPageRoute(
                //   builder: (context)=> FoodDetails(modelFoods: modelFoods,)
                //   )
                // );

                Navigator.pushNamed(context, FoodDetails.screenId, arguments: modelFoods);
            },
            child: Card(
              elevation: 7,
              shadowColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
              ),
              child: Column(
                children: [
                  Flexible(
                      child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                      child: Image.asset(
                        modelFoods.image, 
                        fit: BoxFit.fill,
                        height: double.infinity),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(8.0),
                  child: Text(modelFoods.name, style: TextStyle(fontSize: 25, fontFamily: 'Nunito'),),)
                ],

              ),
            )
          );
        });
  }
}