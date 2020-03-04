import 'package:brew_crew_app/screens/authenticate/authenticate.dart';
import 'package:brew_crew_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew_app/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
//                          <type of data that the stream listen to>
    print(user);

    //return to home or authenticate widget depending on the state of authentication
    // user = id or user = null

    if(user == null){
      print('opening authenticate');
      return Authenticate();
    }else{
      print('opening home');
      return Home();
    }

  }
}
