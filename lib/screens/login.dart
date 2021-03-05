import 'package:FindMySchool/theme/colors.dart';
import 'package:FindMySchool/theme/text.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColorDark,
        title: Text('Login Screen', style: AppBarTextStyle,),
        centerTitle: true,

      ),
      body: Center(
        child: Container(
          child: Text("In Login Screen", style: NormalTextStyle,),
        ),
      ),
    );
  }
}
