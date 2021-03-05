import 'package:FindMySchool/screens/splash.dart';
import 'package:FindMySchool/screens/welcome.dart';
import 'package:flutter/material.dart';

import 'screens/splash.dart';
//import 'colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      // home: Scaffold(
      //   appBar: AppBar(
      //     elevation: 0.0,
      //     backgroundColor: primaryColor,
      //     centerTitle: true,
      //     title: Text(
      //       "Find My School",
      //       style: TextStyle(
      //         fontWeight: FontWeight.bold,
      //         color: Colors.white,
      //         fontFamily: 'ss',
      //       ),
      //     ),
      //   ),
      //   body: Center(
      //       child: Text(
      //     "This is Center Text",
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontSize: 30,
      //       fontFamily: 'ss',
      //     ),
      //   )),
      // ),
    );
  }
}
