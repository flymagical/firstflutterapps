import 'package:flutter/material.dart';
import 'package:flutter_apps/screens/loginscreen.dart';
import 'package:splashscreen/splashscreen.dart';


class SplashLoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: LoginScreen(),
      title: Text('Welcome to FlutterApp'),
      image: Image.asset('images/flutter.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.blue
    );
  }
}