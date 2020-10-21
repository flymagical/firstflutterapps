import "package:flutter/material.dart";
import 'package:flutter_apps/screens/camerascreen.dart';
import 'package:flutter_apps/screens/databasescreen.dart';
import 'package:flutter_apps/screens/foodscreen.dart';
import 'package:flutter_apps/screens/drinkscreen.dart';
import 'package:flutter_apps/screens/newsportalscreen.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatelessWidget {
  static String screenId = "home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: TextStyle(fontFamily: 'Nunito'),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Column(
            children: [
              Flexible(
                child: Row(
                  children: [
                    // clsGridMenuTemplate("Foods", "images/vegan-food.png",
                    //     Colors.blue, context, Foods()),
                    clsGridMenuTemplate("Foods", "images/vegan-food.png",
                        Colors.blue, context, Foods.screenId),
                    clsGridMenuTemplate("Drinks", "images/no-drinks.png",
                        Colors.blue, context, Drinks.screenId),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    clsGridMenuTemplate("News Portal", "images/internet.png",
                        Colors.blue, context, NewsPortalScreen.screenId),
                    clsGridMenuTemplate("Photo Gallery", "images/dress.png",
                        Colors.blue, context, Camera.screenId),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    clsGridMenuTemplate("Database SQFLite", "images/internet.png",
                        Colors.blue, context, DatabaseScreen.screenId),
                    clsGridMenuTemplate("Photo Gallery", "images/dress.png",
                        Colors.blue, context, Camera.screenId),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.blue,
      //onTap: onItemTapped,
    ),
    );
  }

  //Widget clsGridMenuTemplate(String title, String image, Color color, BuildContext context, Widget action) {
  Widget clsGridMenuTemplate(String title, String image, Color color, BuildContext context, String action) {
    return Flexible(
      child: GestureDetector(
        onTap: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context)=> action));
          Navigator.pushNamed(context, action);
        },
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            color: color,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Image.asset(
                    image,
                    width: 60,
                    height: 60,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontFamily: 'Nunito'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


