import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String first,
      middle,
      last,
      city,
      country,
      state,
      address,
      postal,
      email,
      gender;
  final databaseReference = Firestore.instance;

  void getData() {
    databaseReference
        .collection('Students')
        .document('1')
        .get()
        .then((DocumentSnapshot ds) {
      print(ds.data);
    });
    notifyListeners();
  }
}
