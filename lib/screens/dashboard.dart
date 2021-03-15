import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        centerTitle: true,

      ),
      body: Center(child: FlatButton(
        color: Colors.blueAccent,
        child: Text("Logout"),
        onPressed: () async {
          try {
            await FirebaseAuth.instance.signOut();
          } catch (e) {
            print(e);
          }
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
        },
      )),
    );
  }
}
