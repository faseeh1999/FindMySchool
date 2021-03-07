import 'package:FindMySchool/screens/login.dart';
import 'package:FindMySchool/screens/signup.dart';
import 'package:FindMySchool/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../theme/colors.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/welcome.png'),
        //     fit: BoxFit.cover,
        //   ),
        // ),

        //color: primaryColor,
        // decoration: new BoxDecoration(
        //   borderRadius: new BorderRadius.circular(16.0),
        //   color: Colors.green,
        // ),

        child: Stack(

          fit: StackFit.expand,
          children: [

            Image.asset(
              'assets/images/welcome.png',
              fit: BoxFit.cover,
            ),
            Column(

              children: [
                SizedBox(
                  height: 80.0,
                ),
                Text("Welcome To",
                  style: TextStyle(
                      fontSize: 25 ,
                      fontFamily: 'ss',
                      fontWeight: FontWeight.w200,
                      color: Colors.white

                  ),



                ),

                SizedBox(
                  height: 20.0,
                ),
                Text("Find My School",
                  style: TextStyle(
                      fontSize: 35 ,
                      fontFamily: 'ss',
                      fontWeight: FontWeight.bold,
                      color: Colors.white

                  ),

                ),

                SizedBox(
                  height: 380.0,
                ),
                RaisedButton(onPressed: (){

                  Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 500),
                                child: SignUpScreen()));
                },

                  child: Text("Create a New Account", style: ButtonTextStyle,),
                    elevation: 2.0,
                    highlightElevation: 8.0,
                    color: buttonColor,
                    textColor: Colors.white,
                    splashColor: Colors.blue[200],
                    hoverElevation: 8.0,
                    hoverColor: Colors.green,
                    padding: EdgeInsets.only(left: 25.0,right: 25.0),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),


                ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(

                    onTap: (){
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 500),
                              child: LoginScreen()));



                    },
                    child: Text(
                      "Already Have an Account?",
                      style: LinkTextStyle,

                    ),
                  )


              ],
            ),


          ],

        ),

          //fit: StackFit.loose,



            //
            // SizedBox(height: 10.0),

            // SizedBox(height: 10.0),
            // RaisedButton(onPressed: (){
            //   Navigator.push(
            //       context,
            //       PageTransition(
            //           type: PageTransitionType.fade,
            //           duration: Duration(milliseconds: 500),
            //           child: SignUpScreen()));
            // }
            //
            //   , child: Text("Create a New Account", style: ButtonTextStyle,),
            //   elevation: 2.0,
            //   highlightElevation: 8.0,
            //   color: buttonColor,
            //   textColor: Colors.white,
            //   splashColor: Colors.blue[200],
            //   hoverElevation: 8.0,
            //   hoverColor: Colors.green,
            //   padding: EdgeInsets.only(left: 25.0,right: 25.0),
            //
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(18.0),
            //
            //     //side: BorderSide(color: Colors.red)
            //   ),
            // ),
            //
            // GestureDetector(
            //
            //   onTap: (){
            //     Navigator.push(
            //         context,
            //         PageTransition(
            //             type: PageTransitionType.fade,
            //             duration: Duration(milliseconds: 500),
            //             child: LoginScreen()));
            //
            //
            //
            //   },
            //   child: Text(
            //     "Already Have an Account?",
            //     style: LinkTextStyle,
            //
            //   ),
            // )
            //Image.asset('assets/images/welcome.png', fit: BoxFit.cover,),




        ),
        //   Image.asset(
        //   //   'assets/images/welcome.png',
        //   //   fit: BoxFit.cover,
        //   // ),
        // ),
      );
  }
}
