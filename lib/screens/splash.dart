import 'package:FindMySchool/screens/bottombar.dart';
import 'package:FindMySchool/screens/dashboard.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'introduction.dart';

String finalEmail, finalToken;


String email;



class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  // void getUserEmail(){
  //
  //   User user = FirebaseAuth.instance.currentUser;
  //   setState(() {
  //     email = user.email;
  //   });
  // }




  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    var obtainedToken = sharedPreferences.getString('token');
    setState(() {
      finalEmail = obtainedEmail;
      finalToken = obtainedToken;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getUserEmail();
    getValidationData().whenComplete(() async {
      Future.delayed(Duration(milliseconds: 2800), () {
        Navigator.pushReplacement(
            context,

            finalEmail == null && finalToken ==null ?
            PageTransition(
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 300),
                child: Introduction())

                :
            PageTransition(
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 300),
                child: BottomNavBar())



        );



      });
    });


  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;





    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 450.0),
              child: Center(
                child: TextLiquidFill(
                  loadDuration: Duration(seconds: 2),
                  textAlign: TextAlign.center,
                  text: 'Find My School',
                  waveColor: Colors.blue[700],
                  boxBackgroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ss',
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
