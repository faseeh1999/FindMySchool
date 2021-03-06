import 'package:FindMySchool/screens/drawer/maindrawer.dart';
import 'package:FindMySchool/screens/settings/about.dart';
import 'package:FindMySchool/screens/settings/changePassword.dart';
import 'package:FindMySchool/screens/settings/contact.dart';
import 'package:FindMySchool/screens/settings/privacy.dart';
import 'package:FindMySchool/screens/settings/terms.dart';
import 'file:///C:/Flutter%20Projects/FindMySchool/lib/screens/authentication/welcome.dart';
import 'package:FindMySchool/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    Key key,
  }) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // To get User email & Name from Firebase




  @override
  Widget build(BuildContext context) {

    // Future getUserData() async {
    //   print("Aaaaaaalu");
    //   final SharedPreferences sharedPreferences =
    //   await SharedPreferences.getInstance();
    //   var obtainedEmail = sharedPreferences.getString('email');
    //   print(obtainedEmail);
    //   var obtainedToken = sharedPreferences.getString('token');
    //   setState(() {
    //     finalEmail = obtainedEmail.toString();
    //     finalToken = obtainedToken.toString();
    //   });
    // }


    Size size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontFamily: "ss"),
        ),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Settings.png',
            fit: BoxFit.cover,
          ),
          Center(
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
                          color: Colors.white.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Text(
                    "Name",
                    style: TextStyle(fontFamily: 'ss', fontSize: 20,color: Colors.white),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(fontFamily: 'ss', fontSize: 14,color: Colors.white),
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),

                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: RaisedButton(
                      elevation: 0.5,
                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                      onPressed: () {},
                      textColor: Colors.black,
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Account",
                              style: TextStyle(fontFamily: 'ss', fontSize: 16))),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: RaisedButton(
                      elevation: 0.5,
                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: ChangePassword(),
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300)));
                      },
                      textColor: Colors.black,
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Change Password",
                            style: TextStyle(fontFamily: 'ss', fontSize: 16),
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: RaisedButton(
                      elevation: 0.5,
                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: TermsScreen(),
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300)));

                      },
                      textColor: Colors.black,
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Terms & Conditions",
                            style: TextStyle(fontFamily: 'ss', fontSize: 16),
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: RaisedButton(
                      elevation: 0.5,
                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: ContactUs(),
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300)));
                      },
                      textColor: Colors.black,
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Contact Us",
                              style: TextStyle(fontFamily: 'ss', fontSize: 16))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: RaisedButton(
                      elevation: 0.5,
                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: AboutScreen(),
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300)));
                      },
                      textColor: Colors.black,
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("About Us",
                              style: TextStyle(fontFamily: 'ss', fontSize: 16))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: RaisedButton(
                      elevation: 0.5,
                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: PrivacyScreen(),
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300)));
                      },
                      textColor: Colors.black,
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Privacy Policy",
                              style: TextStyle(fontFamily: 'ss', fontSize: 16))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: RaisedButton(
                      elevation: 0.5,
                      //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                      onPressed: () {

                        Widget logoutButton = FlatButton(
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
                              Navigator.pushReplacement(
                                context,
                              PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 300),
                              child: WelcomeScreen()),
                              );
                              },
                              );

                              Widget cancelButton = FlatButton(
                              child: Text("No"),
                              onPressed: () => Navigator.pop(context),
                              );

                              // set up the AlertDialog
                              AlertDialog alert = AlertDialog(
                              title: Text("Confirm Logout"),
                              content: Text("Are you sure you want to Logout?"),
                              actions: [
                              cancelButton,
                              logoutButton,
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


                      textColor: Colors.black,
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Logout",
                              style: TextStyle(fontFamily: 'ss', fontSize: 16))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
