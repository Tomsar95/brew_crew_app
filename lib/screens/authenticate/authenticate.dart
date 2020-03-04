import 'package:brew_crew_app/screens/authenticate/register.dart';
import 'package:brew_crew_app/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

//to create a StatefulWidget, type stful and enter
// change the name in all spaces pressing alt

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = ! showSignIn; // reverse the value of showSignIn
    });
  }

  @override
  Widget build(BuildContext context) {
    //Wrapper between Sign in and Sign Up
    if (showSignIn){
      return SignIn(toggleView: toggleView); // pass toggleView as parameter
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
