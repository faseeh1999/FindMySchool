import 'package:FindMySchool/screens/changePassword.dart';
import 'package:FindMySchool/screens/login.dart';
import 'package:FindMySchool/screens/settings.dart';
import 'package:FindMySchool/screens/signup.dart';
import 'package:FindMySchool/screens/splash.dart';
import 'package:FindMySchool/screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/splash.dart';
//import 'colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp().then((value){

    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangePassword(),

    );
  }
}
