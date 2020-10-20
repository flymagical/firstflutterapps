import 'package:flutter/material.dart';
import 'package:flutter_apps/models/model_foods.dart';
import 'package:flutter_apps/screens/ui/ui_food.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Foods extends StatelessWidget {
  final UIFoods uiFoods = UIFoods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foods List View", style: TextStyle(fontFamily: 'Nunito'),),
        
      ),
      body: uiFoods.buildFoodListView(),
    );
  }
}

class FoodDetails extends StatelessWidget {
  final UIFoods uiFoods = UIFoods();
  final ModelFoods modelFoods;

  FoodDetails({Key key, @required this.modelFoods}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Food Details", 
          style: TextStyle(
            fontFamily: 'Nunito'
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.open_in_browser
            ), onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => WebViewFoods(modelFoods: modelFoods)));
            },
          )
        ],
      ),
      body: uiFoods.buildFoodDetail(modelFoods)
    );
  }
}

class WebViewFoods extends StatelessWidget {
  final ModelFoods modelFoods;

  WebViewFoods({Key key, @required this.modelFoods}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(modelFoods.name),
      ),
      url: modelFoods.url
    );
  }
}   