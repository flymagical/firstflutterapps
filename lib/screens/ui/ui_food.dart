import 'package:flutter/material.dart';
import 'package:flutter_apps/data/data_foods.dart';
import 'package:flutter_apps/models/model_foods.dart';
import 'package:flutter_apps/screens/foodscreen.dart';

class UIFoods {
  
  Widget buildFoodListView() {
    return ListView.builder(
        itemCount: DataFoods.itemFoodNums,
        itemBuilder: (context, index) {
          ModelFoods foods = DataFoods.getItemFoods(index);
          return InkWell(
            onTap: () {
              // Navigator.push(
              //   context, 
              //   MaterialPageRoute(
              //     builder: (context)=> FoodDetails(modelFoods: foods,)
              //     )
              //   );

              //using pushnamed with parameters
              Navigator.pushNamed(context, FoodDetails.screenId, arguments: foods);
            },
            child: Card(
              elevation: 7,
              shadowColor: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 3),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  //decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(foods.name, style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.blue[200], fontFamily: 'Nunito'),),
                              Text(getInitialDetails(foods.details), style: TextStyle(fontFamily: 'Nunito'),)
                            ],
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage(foods.image),
                            radius: 45,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  String getInitialDetails(String foodDetails){
    if(foodDetails.length >= 50){
return foodDetails.substring(0,50)+" ...";
    }else{
      return foodDetails;
    }
    
  }

  Widget buildFoodDetail(ModelFoods modelFoods){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(25)),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.blue[100], borderRadius: BorderRadius.circular(25)),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, right:50),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.blue[300], borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30))),
                      width: double.infinity,
                      child: Container(
                        margin: EdgeInsets.only(left:20, top:10, bottom:10),
                        child: Text(modelFoods.name.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white, fontFamily: 'Nunito'),))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(modelFoods.image),
                    ),
                  ),
                ],
              ),
            ),
            // Image.asset(modelFoods.image),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:50, right:50),
              child: Text(
                modelFoods.details,
                style: TextStyle(fontFamily: 'Nunito', color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}


