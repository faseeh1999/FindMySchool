import 'package:FindMySchool/screens/signup.dart';
import 'package:FindMySchool/screens/welcome.dart';
import 'package:FindMySchool/theme/colors.dart';
import 'package:FindMySchool/theme/text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';

import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  bool _validate() {
    return _form.currentState.validate();
  }

  final validatePassword =
      ValidationBuilder().required().minLength(6).maxLength(20).build();
  final validateEmail = ValidationBuilder()
      .required("This Field is Required")
      .email()
      .maxLength(50)
      .build();

  void logIn() async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseFirestore.instance
          .doc("user/${_email.text}")
          .get()
          .then((doc) async {
        if (doc.exists) {
          try {
            // ignore: unused_local_variable
            UserCredential user = await _auth.signInWithEmailAndPassword(
                email: _email.text, password: _pass.text);
            setState(() {
              isLoading = false;
            });

            Navigator.pushAndRemoveUntil(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 500),
                    child: Dashboard()),
                (route) => false);
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              setState(() {
                isLoading = false;
              });
              print("User not found");
            } else if (e.code == 'wrong-password') {
              setState(() {
                isLoading = false;
              });

              print("Wrong Password");

              Widget okButton = FlatButton(
                child: Text("Try Again"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              );

              // set up the AlertDialog
              AlertDialog alert = AlertDialog(
                title: Text("Wrong Password"),
                content: Text("The Passowrd You Entered is Incorrect."),
                actions: [
                  okButton,
                ],
              );
              // show the dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            }
          } catch (e) {
            setState(() {
              isLoading = false;
            });
            print("Error: " + e);
          }
        } else {
          setState(() {
            isLoading = false;
          });
          print("User Not Found");
          Widget okButton = FlatButton(
            child: Text("Try Again"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          );

          // set up the AlertDialog
          AlertDialog alert = AlertDialog(
            title: Text("Wrong Email Address"),
            content: Text("The Email Address You Entered is Incorrect."),
            actions: [
              okButton,
            ],
          );
          // show the dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        }
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      print(e);

      Widget okButton = FlatButton(
        child: Text("Try Again"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text(
          "Something Went Wrong",
          style: TextStyle(fontFamily: 'ss'),
        ),
        content: Text(
          "The Email Address You Entered is Incorrect.",
          style: TextStyle(fontFamily: 'ss'),
        ),
        actions: [
          okButton,
        ],
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontFamily: 'ss', fontSize: 20),
                ),
                SizedBox(
                  height: size.height * 0.04,
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
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Form(
                    key: _form,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _email,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validateEmail,
                          decoration: InputDecoration(
                              labelText: "Email", border: OutlineInputBorder()),
                        ),
                        SizedBox(height: size.height * 0.04),
                        TextFormField(
                          controller: _pass,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validatePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(height: size.height * 0.04),
                        RaisedButton.icon(
                          elevation: 3.0,
                          onPressed: () {
                            if (_validate() == true) {
                              logIn();
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.0))),
                          label: Text(
                            'Login Wth Email',
                            style: ButtonTextStyle,
                          ),
                          icon: Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          textColor: Colors.white,
                          splashColor: Colors.blueAccent,
                          color: buttonColor,
                          padding: EdgeInsets.only(left: 35.0, right: 35.0),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text(
                          "OR",
                          style: TextStyle(fontFamily: 'ss', fontSize: 16.0),
                        ),
                        SizedBox(height: size.height * 0.01),
                        RaisedButton.icon(
                          elevation: 3.0,
                          onPressed: () {
                            if (_validate() == true) {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 500),
                                      child: SignUpScreen()));
                            } else {
                              _validate();
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.0))),
                          label: Text(
                            'Login Wth Google',
                            style: ButtonTextStyle,
                          ),
                          icon: Image.asset('assets/icons/google.png'),
                          textColor: Colors.white,
                          splashColor: Colors.blueAccent,
                          color: buttonColor,
                          padding: EdgeInsets.only(left: 35.0, right: 35.0),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Divider(
                          color: Colors.grey[800],
                        ),
                        SizedBox(height: size.height * 0.05),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 500),
                                      child: WelcomeScreen()));
                            },
                            child: Text(
                              "Forgot Your Password?",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'ss',
                                  decoration: TextDecoration.underline),
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
