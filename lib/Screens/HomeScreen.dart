import 'package:apli/Screens/Profile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(EvaIcons.personOutline),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => Profile()));
                    }),
                Text(
                  "Apli",
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontFamily: 'Google Sans',
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                    icon: Icon(EvaIcons.settings2Outline), onPressed: () {}),
              ],
            ),
          ),
        ],
      ))),
    );
  }
}
