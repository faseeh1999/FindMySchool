import 'package:FindMySchool/theme/colors.dart';
import 'package:FindMySchool/theme/text.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8.0,
        title: Text("Sign Up", style: AppBarTextStyle, ),
        centerTitle: true,
        backgroundColor: primaryColorDark,
      ),
      body: Center(
        child: Container(
          child: Text("In Signup Screen", style: NormalTextStyle)
        ),
      ),
    );
  }
}
