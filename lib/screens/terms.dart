import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(

        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Terms & Conditions",
          style: TextStyle(
              fontFamily: 'ss',
              color: Colors.black),
        ),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: size.height*0.3 ,
                color: Colors.pink,
                width: size.width,
                child: Text("Find My School"),
              ),
              SizedBox(height: size.height*0.7,),
              Container(
                color: Colors.black,
                height: size.height*0.7,
                width: size.width*0.9,
              )
            ],
          ),
        ],
      ),
    );
  }
}
