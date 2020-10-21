import 'package:flutter/material.dart';
import 'package:flutter_apps/screens/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  static final String screenId = "login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /*
   * REGION GLOBAL VARIABLES */
  var formKey = GlobalKey<FormState>();
  bool isValid = false;

  // END REGION

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("images/scooter.png"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Form(
                autovalidate: isValid,
                autovalidateMode: AutovalidateMode.always,
                key: formKey,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        //margin: EdgeInsets.only(top: -100),
                        // width: 500,
                        // height: 500.0,
                        // decoration: new BoxDecoration(
                        //   color: Colors.orange,
                        //   shape: BoxShape.circle,
                        // ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 100, bottom: 50),
                          child: Image.asset(
                            'images/flutter.png',
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          'WELCOME BACK',
                          style: TextStyle(
                              fontSize: 23,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[200]),
                              
                        ),
                      ),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: validateEmail,
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.blue[200],
                            ),
                            hintText: "Input your email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Colors.blue[200]),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Colors.blue[200]),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        validator: validatePassword,
                        style: TextStyle(color: Colors.blue[200]),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.blue[200],
                          ),
                          hintText: "Input your password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.blue[200]),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.blue[200]),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton(
                        onPressed: checkIsValid,
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20, fontFamily: 'Nunito'),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: Colors.blue[200]),
                        ),
                        color: Colors.blue[200],
                        textColor: Colors.white,
                        minWidth: double.infinity,
                        height: 50,
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }

  /*
  * REGION METHODS
  */
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value.trim()))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.length < 6) {
      return 'Password must contain at leats 5 characters';
    } else {
      return null;
    }
  }

  checkIsValid() async {
    if(formKey.currentState.validate()){
      Toast.show("Login succeed", context);
      //SET LOGIN SESSION
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool("session", true);
      //to move another page, then call Navigator.
      //Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
      Navigator.pushNamed(context, Home.screenId);
    }else{
      Toast.show("Login failed", context);
    }
  }
  //END OF REGION 
}
