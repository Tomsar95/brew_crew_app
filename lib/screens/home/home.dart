import 'package:brew_crew_app/models/brew.dart';
import 'package:brew_crew_app/screens/home/settings_form.dart';
import 'package:brew_crew_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew_app/screens/home/brew_list.dart';

//to create a StatelessWidget, type stless and enter

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }


    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.orangeAccent[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.orange[400],
          //elevation: 0.0, //shadow of the bar
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ], //actions: group of widgets

        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffeeBKG.jpg'),
              fit: BoxFit.cover,
            ),
          ),
            child: BrewList(),
        ),
      ),
    );
  }
}


