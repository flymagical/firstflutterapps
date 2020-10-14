import 'package:flutter/material.dart';
import 'package:flutter_apps/screens/homescreen.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
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
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Image.asset(
                          'images/flutter.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          'WELCOME BACK',
                          style: TextStyle(
                              fontSize: 23,
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
                          style: TextStyle(fontSize: 20),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: Colors.blue[200]),
                        ),
                        color: Colors.blue[200],
                        textColor: Colors.white,
                        minWidth: double.infinity,
                        height: 50,
                      )
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

  void checkIsValid() {
    if(formKey.currentState.validate()){
      Toast.show("Login succeed", context);
      //to move another page, then call Navigator.

      Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
    }else{
      Toast.show("Login failed", context);
    }
  }
  //END OF REGION 
}
