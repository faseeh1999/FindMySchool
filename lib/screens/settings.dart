import 'package:FindMySchool/screens/login.dart';
import 'package:FindMySchool/theme/colors.dart';
import 'package:FindMySchool/theme/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'forgotPassword.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            onPressed: () {
              Widget LogoutButton = FlatButton(
                child: Text("Logout"),
                onPressed: () async {
                  final SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
                  sharedPreferences.remove('email');
                  sharedPreferences.remove('token');

                  try {
                    await FirebaseAuth.instance.signOut();
                  } catch (e) {
                    print(e);
                  }
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                          child: LoginScreen()),
                          (route) => false);
                },
              );

              Widget CancelButton = FlatButton(
                child: Text("No"),
                onPressed: () => Navigator.of(context).pop(),
              );

              // set up the AlertDialog
              AlertDialog alert = AlertDialog(
                title: Text("Confirm Logout"),
                content: Text("Are you sure you want to Logout?"),
                actions: [
                  CancelButton,
                  LogoutButton,
                ],
              );
              // show the dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
          )
        ],
        leading: Icon(
          Icons.menu_sharp,
          color: Colors.black,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Settings",
          style: TextStyle(
              color: Colors.black,
            fontFamily: "ss"
          ),
        ),
          centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[100].withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_outline_rounded,
                  color: iconColor,
                  size: 50.0,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Text(
                "Name",
                style: TextStyle(fontFamily: 'ss', fontSize: 20),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "Email",
                style: TextStyle(fontFamily: 'ss', fontSize: 14),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),

              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: RaisedButton(
                  elevation: 0.5,
                  padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                  onPressed: (){},
                  textColor: Colors.black,
                  color: Colors.white,
                  child: Text("Account", style: TextStyle(fontFamily: 'ss'),),

                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: RaisedButton(
                  elevation: 0.5,
                  padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                  onPressed: (){},
                  textColor: Colors.black,
                  color: Colors.white,
                  child: Text("Change", style: TextStyle(fontFamily: 'ss'),),

                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: RaisedButton(
                  elevation: 0.5,
                  padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                  onPressed: (){},
                  textColor: Colors.black,
                  color: Colors.white,
                  child: Text("Terms   ", style: TextStyle(fontFamily: 'ss'),),

                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: RaisedButton(

                  elevation: 0.5,
                  padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                  onPressed: (){},
                  textColor: Colors.black,
                  color: Colors.white,
                  child: Text("Contact", style: TextStyle(fontFamily: 'ss')),

                ),
              ),

              // Login Form Starts from here.

            ],
          ),
        ),
      ),
    );
  }
}