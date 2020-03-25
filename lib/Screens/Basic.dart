import 'package:apli/Model/Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gender_selector/gender_selector.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Basic extends StatefulWidget {
  @override
  _BasicState createState() => _BasicState();
}

class _BasicState extends State<Basic> {
  User u1;
  final databaseReference = Firestore.instance;
  final fname = TextEditingController();
  final mname = TextEditingController();
  final lname = TextEditingController();
  final city = TextEditingController();
  final country = TextEditingController();
  final state = TextEditingController();
  final address = TextEditingController();
  final postal = TextEditingController();
  final email = TextEditingController();
  var selectedGender;
  final format = DateFormat("yyyy-MM-dd");
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  void updateData(String field, String ans) {
    try {
      databaseReference
          .collection('Students')
          .document('1')
          .collection('Info')
          .document('TUm1ZKCAOxIHGNYtKNqK')
          .updateData({field: ans});
    } catch (e) {
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
     u1 = Provider.of<User>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "About",
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
                controller: fname,
                onEditingComplete: () => updateData('First', fname.text),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      EvaIcons.personOutline,
                      color: Colors.black,
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    labelText: 'First Name',
                    labelStyle: TextStyle(color: Colors.black)),
              )),
          Padding(
              padding: EdgeInsets.all(30.0),
              child: TextField(
                  controller: mname,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        EvaIcons.personOutline,
                        color: Colors.black,
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff4285f4))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff4285f4))),
                      labelText: 'Middle Name',
                      labelStyle: TextStyle(color: Colors.black)),
                  onEditingComplete: () => updateData('Middle', mname.text))),
          Padding(
              padding: EdgeInsets.all(30.0),
              child: TextField(
                controller: lname,
                onEditingComplete: () => updateData('Last', lname.text),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      EvaIcons.personOutline,
                      color: Colors.black,
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    labelText: 'Last Name',
                    labelStyle: TextStyle(color: Colors.black)),
              )),
          Divider(
            thickness: 2.0,
            color: Colors.black,
          ),
          Padding(
              padding: EdgeInsets.all(30.0),
              child: TextField(
                controller: email,
                onEditingComplete: () => updateData('Email', email.text),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      EvaIcons.emailOutline,
                      color: Colors.black,
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black)),
              )),
              GenderSelector(
  margin: EdgeInsets.only(left: 10, top: 30, right: 10, bottom: 10,),
  selectedGender: selectedGender,
  onChanged: (gender) async {
  u1.getData();
    setState(() {
      if(gender == Gender.FEMALE) {
        selectedGender = Gender.FEMALE;
        updateData('Gender' , 'female');
      } else {
        updateData('Gender' , 'male');
        selectedGender = Gender.MALE;
      }
    });

  },

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
                  updateData('DOB', date.toString());
                  return date;
                },
                decoration: InputDecoration(
                  labelText: "DOB",
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
                  controller: address,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        EvaIcons.mapOutline,
                        color: Colors.black,
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff4285f4))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff4285f4))),
                      labelText: 'Address',
                      labelStyle: TextStyle(color: Colors.black)),
                  onEditingComplete: () =>
                      updateData('Address', address.text))),
          Padding(
              padding: EdgeInsets.all(30.0),
              child: TextField(
                controller: city,
                onEditingComplete: () => updateData('City', city.text),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      EvaIcons.map,
                      color: Colors.black,
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    labelText: 'City',
                    labelStyle: TextStyle(color: Colors.black)),
              )),
          Padding(
              padding: EdgeInsets.all(30.0),
              child: TextField(
                controller: state,
                onEditingComplete: () => updateData('State', state.text),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      EvaIcons.mapOutline,
                      color: Colors.black,
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    labelText: 'State',
                    labelStyle: TextStyle(color: Colors.black)),
              )),
          Padding(
              padding: EdgeInsets.all(30.0),
              child: TextField(
                controller: country,
                onEditingComplete: () => updateData('Country', country.text),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      EvaIcons.map,
                      color: Colors.black,
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    labelText: 'Country',
                    labelStyle: TextStyle(color: Colors.black)),
              )),
          Padding(
              padding: EdgeInsets.all(30.0),
              child: TextField(
                controller: postal,
                onEditingComplete: () => updateData('Postal Code', postal.text),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      EvaIcons.codeOutline,
                      color: Colors.black,
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    labelText: 'Postal Code',
                    labelStyle: TextStyle(color: Colors.black)),
              )),
        ],
      ),
    );
  }
}
