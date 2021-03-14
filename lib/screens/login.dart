import 'package:FindMySchool/theme/colors.dart';
import 'package:FindMySchool/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(fontFamily: 'ss', fontSize: 20),
            ),
            SizedBox(
              height: size.height*0.04,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200].withOpacity(0.8),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.lock,
                color: iconColor,
                size: 50.0,
              ),
            ),
            // Login Form Starts from here.
            Padding(padding: EdgeInsets.all(30.0),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                  ),
                  SizedBox(height: size.height * 0.04),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
                  ),

                  SizedBox(height: size.height * 0.04),
                  RaisedButton.icon(

                    elevation: 3.0,
                    onPressed: (){
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 500),
                              child: null));




                    },
                    shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.all(Radius.circular(18.0))),
                    label: Text('Login Wth Email',
                      style: ButtonTextStyle,),
                    icon: Icon(Icons.email_outlined, color:Colors.white,),
                    textColor: Colors.white,
                    splashColor: Colors.red,
                    color: buttonColor,
                    padding: EdgeInsets.only(left: 35.0, right: 35.0),

                  ),

                  SizedBox(height: size.height * 0.01),

                  Text("OR",style: TextStyle(fontFamily: 'ss', fontSize: 16.0),),

                  SizedBox(height: size.height * 0.01),
                  RaisedButton.icon(

                    elevation: 3.0,
                    onPressed: (){
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 500),
                              child: null));




                      },
                    shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.all(Radius.circular(18.0))),
                    label: Text('Login Wth Google',
                      style: ButtonTextStyle,),
                    icon: Image.asset('assets/icons/google.png'),
                    textColor: Colors.white,
                    splashColor: Colors.red,
                    color: buttonColor,
                  padding: EdgeInsets.only(left: 35.0, right: 35.0),

                  ),
                  SizedBox(height: size.height * 0.03),
                  Divider(
                    color: Colors.grey[800],
                  ),
                  SizedBox(height: size.height * 0.03),
                  Text("Forgot Your Password?", style: TextStyle(fontSize: 16, fontFamily: 'ss', decoration: TextDecoration.underline),)
                  
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //
                  //     IconButton(icon: Icon(Icons.add_alarm, size: 40.0,), onPressed: null),
                  //     SizedBox(width: size.width*0.04),
                  //     IconButton(icon: Icon(Icons.add_alarm, size: 40.0,), onPressed: null),
                  //   ],
                  // ),

                ],
              ),
            ),

            )
          ],
        ),
      ),
    );
  }
}
