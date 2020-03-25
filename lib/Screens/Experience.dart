import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class Experience extends StatefulWidget {
  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  final databaseReference = Firestore.instance;
  final comp = TextEditingController();
  final designation = TextEditingController();
  final responsibility = TextEditingController();
  final TextEditingController etype = new TextEditingController();
  final TextEditingController itype = new TextEditingController();
  final TextEditingController domain = new TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final format = DateFormat("yyyy-MM-dd");
  var items = ['Intern', 'Job'];
  var items2 = ['Intern', 'Job'];
  var items3 = ['Intern', 'Job'];
  void updateData(String field, String ans) {
    try {
      databaseReference
          .collection('Students')
          .document('1')
          .collection('Expereince')
          .document('vaVTmoCqRapZJmkjLUG1')
          .updateData({field: ans});
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Experience",
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontFamily: 'Google Sans',
                      fontWeight: FontWeight.bold),
                ),
              ]),
          new Padding(
            padding: const EdgeInsets.all(30.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                    child: new TextField(
                  controller: etype,
                  decoration: InputDecoration(
                      labelText: 'Experience Type',
                      labelStyle: TextStyle(color: Colors.black)),
                )),
                new PopupMenuButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  onSelected: (String value) {
                    etype.text = value;
                    updateData("Industry", etype.text);
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
          Padding(
              padding: EdgeInsets.all(30.0),
              child: TextField(
                controller: comp,
                onEditingComplete: () => updateData('Company', comp.text),
                decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    labelText: 'Company',
                    labelStyle: TextStyle(color: Colors.black)),
              )),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: DateTimeField(
                format: format,
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                  updateData('From', date.toString());
                  return date;
                },
                decoration: InputDecoration(
                  labelText: "From",
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff4285f4))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff4285f4))),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: DateTimeField(
                format: format,
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                  updateData('To', date.toString());
                  return date;
                },
                decoration: InputDecoration(
                  labelText: "To",
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff4285f4))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff4285f4))),
                )),
          ),
          Divider(
            thickness: 2.0,
            color: Colors.black,
          ),
          Padding(
              padding: EdgeInsets.all(30.0),
              child: TextField(
                  controller: designation,
                  decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff4285f4))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff4285f4))),
                      labelText: 'Designation',
                      labelStyle: TextStyle(color: Colors.black)),
                  onEditingComplete: () =>
                      updateData('Designation', designation.text))),
          new Padding(
            padding: const EdgeInsets.all(30.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                    child: new TextField(
                  controller: itype,
                  decoration: InputDecoration(
                      labelText: 'Industry Type',
                      labelStyle: TextStyle(color: Colors.black)),
                )),
                new PopupMenuButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  onSelected: (String value) {
                    itype.text = value;
                    updateData("Industry", itype.text);
                  },
                  itemBuilder: (BuildContext context) {
                    return items2.map<PopupMenuItem<String>>((String value) {
                      return new PopupMenuItem(
                          child: new Text(value), value: value);
                    }).toList();
                  },
                ),
              ],
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(30.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                    child: new TextField(
                  controller: domain,
                  decoration: InputDecoration(
                      labelText: 'Domain',
                      labelStyle: TextStyle(color: Colors.black)),
                )),
                new PopupMenuButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  onSelected: (String value) {
                    domain.text = value;
                    updateData("Domain", domain.text);
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
          Padding(
              padding: EdgeInsets.all(30.0),
              child: Container(
                child: TextField(
                  maxLines: 8,
                  controller: responsibility,
                  onChanged: (value) {
                    updateData('Responsibilities', responsibility.text);
                  },
                  decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff4285f4))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff4285f4))),
                      labelText: 'Responsibilities',
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              )),
        ],
      ),
      padding: EdgeInsets.all(8.0),
    );
  }
}
