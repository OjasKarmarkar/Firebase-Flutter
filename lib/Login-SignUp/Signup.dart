import 'dart:io';
import 'package:apli/Screens/HomeScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Login.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  File _image;
  double height, width;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Future getCam() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Stack(
        children: <Widget>[
          AppBar(
            backgroundColor: Colors.white,
            title: Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Text(
                  "Candidate Signup",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                )),
            centerTitle: true,
            leading: Padding(
              padding: EdgeInsets.only(top: height * 0.006, left: width * 0.03),
              child: IconButton(
                  iconSize: 35.0,
                  icon: Icon(
                    EvaIcons.arrowBackOutline,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.of(context).pushReplacement(
                      new MaterialPageRoute(
                          builder: (context) => new Login()))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.15, left: width * 0.39),
            child: InkWell(
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      color: Color(0xff737373),
                      height: height * 0.15,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(EvaIcons.cameraOutline),
                              title: Text("Pick From Camera"),
                              onTap: () {
                                Navigator.pop(context);
                                getCam();
                              },
                            ),
                            ListTile(
                              leading: Icon(EvaIcons.fileAddOutline),
                              title: Text("Pick From Gallery"),
                              onTap: () async {
                                Navigator.pop(context);
                                getImage();
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              child: Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: new Border.all(
                    color: Color(0xff4285f4),
                    width: 2.0,
                  ),
                ),
                child: CircleAvatar(
                    minRadius: height * 0.04,
                    maxRadius: height * 0.065,
                    child: _image == null
                        ? ClipOval(
                            child: Image.asset(
                            "assets/forgot.png",
                            fit: BoxFit.fill,
                            width: width * 0.25,
                            height: height * 0.3,
                          ))
                        : ClipOval(
                            child: Image.file(
                            _image,
                            fit: BoxFit.fill,
                            width: width * 0.25,
                            height: height * 0.3,
                          ))),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: height * 0.35, left: width * 0.1, right: width * 0.1),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      EvaIcons.personOutline,
                      color: Colors.black,
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    labelText: 'Candidate Name',
                    labelStyle: TextStyle(color: Colors.black)),
              )),
          Padding(
              padding: EdgeInsets.only(
                  top: height * 0.45, left: width * 0.1, right: width * 0.1),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      EvaIcons.emailOutline,
                      color: Colors.black,
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    labelText: 'Email Address *',
                    labelStyle: TextStyle(color: Colors.black)),
              )),
          Padding(
              padding: EdgeInsets.only(
                  top: height * 0.55, left: width * 0.1, right: width * 0.1),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      EvaIcons.lockOutline,
                      color: Colors.black,
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black)),
              )),
          Padding(
              padding: EdgeInsets.only(
                  top: height * 0.65, left: width * 0.1, right: width * 0.1),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      EvaIcons.lockOutline,
                      color: Colors.black,
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(color: Colors.black)),
              )),
          Padding(
              padding: EdgeInsets.only(top: height * 0.8, left: width * 0.32),
              child: Container(
                height: height * 0.05,
                width: width * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FlatButton(
                    child: Text(
                      "Terms Of Services",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: height * 0.016,
                          color: Colors.black,
                          fontFamily: 'Google Sans',
                          fontWeight: FontWeight.w100),
                    ),
                    onPressed: () => null),
              )),
          Padding(
            padding: EdgeInsets.only(top: height * 0.82),
            child: Center(
              child: Container(
                  height: height * 0.06,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    color: Color(0xff4285f4),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: MaterialButton(
                      child: Text(
                        "Signup",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontFamily: 'Google Sans',
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () =>
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (BuildContext context) => HomeScreen())
                          ))),
            ),
          )
        ],
      ),
    );
  }
}
