import 'package:brew_crew_app/models/user.dart';
import 'package:brew_crew_app/screens/wrapper.dart';
import 'package:brew_crew_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user, //instance of Authservice accesing the user stream on it
      child: MaterialApp(
        // Wrapper will be the home screen
        home: Wrapper(),
      ),
    );
  }
}
