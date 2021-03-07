import 'package:FindMySchool/screens/introduction.dart';
import 'package:FindMySchool/theme/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 2800), () {
      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 900),
              child: Introduction()));
    });
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(

          fit: StackFit.expand,
          children: [

            Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom : 450.0),
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
