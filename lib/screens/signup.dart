import 'package:FindMySchool/theme/colors.dart';
import 'package:FindMySchool/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style: TextStyle(fontFamily: 'ss', fontSize: 20),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200].withOpacity(0.8),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person_rounded,
                color: iconColor,
                size: 50.0,
              ),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text(
                "Sign Up",
                style: ButtonTextStyle,
              ),
              elevation: 2.0,
              highlightElevation: 8.0,
              color: primaryColorDark,
              textColor: Colors.white,
              splashColor: Colors.blue[200],
              hoverElevation: 8.0,
              hoverColor: Colors.green,
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
