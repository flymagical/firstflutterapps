import 'package:flutter/material.dart';
import 'package:flutter_apps/screens/homescreen.dart';
import 'package:flutter_apps/screens/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';


class SplashLoadingScreen extends StatelessWidget {
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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }
}