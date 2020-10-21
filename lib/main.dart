import 'package:flutter/material.dart';
import 'package:flutter_apps/screens/camerascreen.dart';
import 'package:flutter_apps/screens/drinkscreen.dart';
import 'package:flutter_apps/screens/foodscreen.dart';
import 'package:flutter_apps/screens/homescreen.dart';
import 'package:flutter_apps/screens/loginscreen.dart';
import 'package:flutter_apps/screens/newsportalscreen.dart';
import 'package:flutter_apps/screens/splashloading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: SplashLoadingScreen(), //using home
      //using routes:
      onGenerateRoute: (settings) {
        // If you push the PassArguments route
        if (settings.name == FoodDetails.screenId) {
          return MaterialPageRoute(
            builder: (context) {
              return FoodDetails(
                modelFoods: settings.arguments,
              );
            },
          );
        }else if(settings.name == WebViewFoods.screenId){
          return MaterialPageRoute(
            builder: (context) {
              return WebViewFoods(
                modelFoods: settings.arguments,
              );
            },
          );
        }else if(settings.name == NewsDetails.screenId){
          return MaterialPageRoute(
            builder: (context) {
              return NewsDetails(
                articles: settings.arguments,
              );
            },
          );
        }else if(settings.name == WebViewNewsPortal.screenId){
          return MaterialPageRoute(
            builder: (context) {
              return WebViewNewsPortal(
                articles: settings.arguments,
              );
            },
          );
        }
      },

      initialRoute: SplashLoadingScreen.screenId,
      routes: {
        SplashLoadingScreen.screenId: (context) => SplashLoadingScreen(),
        LoginScreen.screenId: (context) => LoginScreen(),
        Home.screenId: (context) => Home(),
        Foods.screenId: (context) => Foods(),
        Drinks.screenId: (context) => Drinks(),
        NewsPortalScreen.screenId: (context) => NewsPortalScreen(),
        Camera.screenId: (context) => Camera(),
      },
      //end of using routes
    );
  }
}
