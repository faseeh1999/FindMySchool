import 'package:flutter/material.dart';

import '../colors.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      // ),
      body: Container(
        color: primaryColor,
        // decoration: new BoxDecoration(
        //   borderRadius: new BorderRadius.circular(16.0),
        //   color: Colors.green,
        // ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text("Welcome To",
              style: TextStyle(
                  fontSize: 18 ,
                  fontFamily: 'ss',
                  fontWeight: FontWeight.w400,
                color: Colors.white

              ),

            ),

            SizedBox(height: 10.0),
            Text("Find My School",
              style: TextStyle(
                  fontSize: 22 ,
                  fontFamily: 'ss',
                  fontWeight: FontWeight.bold,
                  color: Colors.white

              ),

            ),
            //Image.asset('assets/images/welcome.png', fit: BoxFit.cover,),

          ],

        ),
        //   Image.asset(
        //   //   'assets/images/welcome.png',
        //   //   fit: BoxFit.cover,
        //   // ),
        // ),
      ),
    );
  }
}
