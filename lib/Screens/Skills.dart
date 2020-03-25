import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Skills extends StatefulWidget {
  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  final databaseReference = Firestore.instance;
  final skillg = TextEditingController();
  final skillt = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
   final TextEditingController prf = new TextEditingController();
    var items = ['Skill1', 'Skill2'];
  void updateData(String field, String ans) {
    try {
      databaseReference
          .collection('Students')
          .document('1')
          .collection('Skills')
          .document('MsBSHrr75q4oBABw693e')
          .updateData({field: ans});
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Column(children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Skills",
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontFamily: 'Google Sans',
                    fontWeight: FontWeight.bold),
              ),
            ]),
        Padding(
            padding: EdgeInsets.all(30.0),
            child: TextField(
              controller: skillt,
              onChanged: (value) {
                updateData('Skill Group', skillt.text);
              },
              decoration: InputDecoration(
                  hintText: "E.g. Management",
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff4285f4))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff4285f4))),
                  labelText: 'Skill Group',
                  labelStyle: TextStyle(color: Colors.black)),
            )),
        Padding(
            padding: EdgeInsets.all(30.0),
            child: TextField(
              controller: skillg,
              onChanged: (value) {
                updateData('Skill1', skillg.text);
              },
              decoration: InputDecoration(
                 
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff4285f4))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff4285f4))),
                  labelText: 'Skill',
                  labelStyle: TextStyle(color: Colors.black)),
            )),
             new Padding(
            padding: const EdgeInsets.all(30.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                    child: new TextField(
                  controller: prf,
                  decoration: InputDecoration(
                      labelText: 'Proficiency',
                      labelStyle: TextStyle(color: Colors.black)),
                )),
                new PopupMenuButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  onSelected: (String value) {
                    prf.text = value;
                    updateData("Proficiency1", prf.text);
                  },
                  itemBuilder: (BuildContext context) {
                    return items.map<PopupMenuItem<String>>((String value) {
                      return new PopupMenuItem(
                          child: new Text(value), value: value);
                    }).toList();
                  },
                ),
              ],
            ),
          ),
        Divider(
          thickness: 2.0,
          color: Colors.black,
        ),
      ]),
      padding: EdgeInsets.all(30.0),
    );
  }
}
