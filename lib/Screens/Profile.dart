import 'package:apli/Screens/Awards.dart';
import 'package:apli/Screens/Basic.dart';
import 'package:apli/Screens/Experience.dart';
import 'package:apli/Screens/Projects.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'Skills.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
 
int selectedIndex = 0;
var Screens = [Basic() , Experience() , Awards(), Skills()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: FFNavigationBar(
        
        theme: FFNavigationBarTheme(
          barHeight: 70.0,
          barBackgroundColor: Colors.white,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: EvaIcons.infoOutline,
            label: 'Basic Info',
          ),
          FFNavigationBarItem(
            iconData: EvaIcons.personOutline,
            label: 'Education',
          ),
          FFNavigationBarItem(
            iconData: EvaIcons.awardOutline,
            label: 'Awards',
          ),
          FFNavigationBarItem(
            iconData: EvaIcons.barChartOutline,
            label: 'Skills',
          ),
        ],
      ),
        floatingActionButton: FloatingActionButton(onPressed: null , child: Icon(EvaIcons.checkmarkCircle2Outline)),
          body: SingleChildScrollView(
        child: Screens[selectedIndex]
      )),
    );
  }
}
