import 'package:flutter/material.dart';
import 'package:flutter_apps/screens/homescreen.dart';
import 'package:flutter_apps/screens/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';


class SplashLoadingScreen extends StatelessWidget {
  static String screenId = "splash";
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: checkSession(context),
      title: Text('Welcome to FlutterApp'),
      image: Image.asset('images/flutter.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.blue
    );
  }

  checkSession(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool session = pref.getBool("session") ?? false;
    if(session){
      Navigator.pushReplacementNamed(context, Home.screenId);
    }else{
      //Navigator.pushReplacementNamed(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      Navigator.pushReplacementNamed(context, LoginScreen.screenId);
    }
  }
}