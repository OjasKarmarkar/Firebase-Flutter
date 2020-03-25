import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class Awards extends StatefulWidget {
  @override
  _AwardsState createState() => _AwardsState();
}

class _AwardsState extends State<Awards> {
  final databaseReference = Firestore.instance;
  final desc = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final format = DateFormat("yyyy-MM-dd");
  void updateData(String field, String ans) {
    try {
      databaseReference
          .collection('Students')
          .document('1')
          .collection('Awards')
          .document('txwvIPR3OID9ZaH8vJng')
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
                "Awards",
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
              maxLines: 5,
              controller: desc,
              onChanged: (value) {
                updateData('Description', desc.text);
              },
              decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff4285f4))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff4285f4))),
                  labelText: 'Description',
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
                updateData('Date', date.toString());
                return date;
              },
              decoration: InputDecoration(
                labelText: "Date",
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
      ]),
      padding: EdgeInsets.all(30.0),
    );
  }
}
