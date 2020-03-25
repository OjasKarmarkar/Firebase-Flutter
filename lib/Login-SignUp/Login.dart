import 'package:apli/Login-SignUp/Signup.dart';
import 'package:apli/Screens/HomeScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

double height, width;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {});

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: height * 0.4, left: width * 0.33),
            child: Text(
              "Login To Apli",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: height * 0.03,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: height * 0.5, left: width * 0.1, right: width * 0.1),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                    icon: Icon(
                      EvaIcons.personOutline,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4285f4))),
                    labelText: 'Work Email Address',
                    labelStyle: TextStyle(color: Colors.black)),
              )),
          Padding(
              padding: EdgeInsets.only(
                  top: height * 0.60, left: width * 0.1, right: width * 0.1),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(
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
                  top: height * 0.75, left: width * 0.1, right: width * 0.1),
              child: Container(
                height: height * 0.08,
                width: width * 0.3,
                decoration: BoxDecoration(
                  color: Color(0xff4285f4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: MaterialButton(
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontFamily: 'Google Sans',
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () =>
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (BuildContext context) => HomeScreen())
                          )),
              )),
          Padding(
              padding: EdgeInsets.only(top: height * 0.75, left: width * 0.5),
              child: Container(
                height: height * 0.08,
                width: width * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FlatButton(
                    child: Text(
                      "Forgot Password!",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontFamily: 'Google Sans',
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () => null),
              )),
          Padding(
              padding: EdgeInsets.only(top: height * 0.85, left: width * 0.3),
              child: Container(
                height: height * 0.08,
                width: width * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FlatButton(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 18.0,
                        color: Colors.black,
                        fontFamily: 'Google Sans',
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: () => Navigator.of(context).pushReplacement(
                      new MaterialPageRoute(
                          builder: (context) => new SignUpScreen())),
                ),
              )),
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              color: Color(0xff4285f4),
              height: height * 0.45,
              width: width,
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.1, left: width * 0.23),
                child: Text(
                  "Welcome To Apli.ai , \n Get Recruited!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: height * 0.03,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    var firstEndPoint = new Offset(width * 0.3, height * 0.35);
    var firstControlPoint = new Offset(width * 0.01, height * 0.35);
    var secondEndPoint = new Offset(width, height * 0.45);
    var secondControlPoint = new Offset(width, height * 0.35);

    path.lineTo(0, height * 0.2);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(width * 0.75, height * 0.35);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(width, height * 0.4);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
