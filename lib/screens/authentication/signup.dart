import 'file:///C:/Flutter%20Projects/FindMySchool/lib/screens/authentication/login.dart';
import 'package:FindMySchool/theme/colors.dart';
import 'package:FindMySchool/theme/text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_transition/page_transition.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreen> {

  String email , password;

  final FirebaseAuth _auth =  FirebaseAuth.instance;


  GlobalKey<FormState> _form = GlobalKey<FormState>();


  bool isLoading = false;


  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  bool _validate() {

    return _form.currentState.validate();
  }

  bool _obscurePass = true;

  void _togglePass() {
    setState(() {
      _obscurePass = !_obscurePass;
    });
  }



  bool _obscureConfirmPass = true;

  void _toggleConfirmPass() {
    setState(() {
      _obscureConfirmPass = !_obscureConfirmPass;
    });
  }





  final validateName = ValidationBuilder().required().maxLength(30).build();
  final validatePhone = ValidationBuilder().required().phone().maxLength(11).minLength(11).build();
  final validateEmail = ValidationBuilder().required().email().maxLength(50).build();
  final validatePassword = ValidationBuilder().required().minLength(6).maxLength(20).build();




  void signup() async {


    setState(() {
      isLoading= true;
    });
    try {
      // ignore: unused_local_variable
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: _email.text, password: _pass.text);


      // setState(() {
      //   signUp = true;
      // });
      if (user != null) {
        try {
          FirebaseFirestore.instance
              .collection("user")
              .doc("${_email.text}")
              .set({
            'created_at': Timestamp.now(),
            'username': _name.text,
            'email': _email.text,
            'number': _phone.text,
          });
        } catch (e) {
          setState(() {
            isLoading= false;
          });
          print('Error is: ' + e);

        }
      }
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                'Registered Successfully!',
                style: TextStyle(color: Colors.black),
              ),
              actions: <Widget>[
                FlatButton(
                  color: buttonColor,
                  child: Text(
                    "Continue",
                    style:
                    ButtonTextStyle,
                  ),
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signOut();
                    } catch (e) {
                      setState(() {
                        isLoading= false;
                      });
                      print(e);
                    }
                    setState(() {
                      isLoading= false;
                    });

                    Navigator.pushAndRemoveUntil(

                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                            (route) => false);
                  },
                ),
              ],
            );
          }).then((value) async {
        try {
          await FirebaseAuth.instance.signOut();
          setState(() {
            isLoading= false;
          });
        }
        catch (e) {
          setState(() {
            isLoading= false;
          });
          print(e);
        }
        setState(() {
          isLoading= false;
        });
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() {
          isLoading= false;
        });
        // setState(() {
        //   signUp = true;
        // });
        // fToast.showToast(
        //   child: ToastWidget.toast(
        //       'Email already in use', Icon(Icons.error, size: 20)),
        //   toastDuration: Duration(seconds: 2),
        //   gravity: ToastGravity.BOTTOM,
        // );
      }
    } catch (e) {
      setState(() {
        isLoading= false;
      });
      print("Error: " + e);
    }
  }








  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign Up", style: TextStyle(color: Colors.black, fontFamily: 'ss'),),
          centerTitle: true,
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
                    Icons.person_outline_rounded,
                    color: iconColor,
                    size: 50.0,
                  ),
                ),
                // Login Form Starts from here.
                Padding(padding: EdgeInsets.all(30.0),
                  child: Form(
                    key: _form,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _name,

                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validateName,
                          decoration: InputDecoration(labelText: "Name", border: OutlineInputBorder()),
                        ),
                        SizedBox(height: size.height * 0.04),
                        TextFormField(
                          controller: _email,

                          keyboardType: TextInputType.emailAddress,

                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validateEmail,
                          decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                        ),
                        SizedBox(height: size.height * 0.04),
                        TextFormField(
                          controller: _phone,
                          keyboardType: TextInputType.phone,

                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validatePhone,
                          decoration: InputDecoration(labelText: "Phone Number", border: OutlineInputBorder()),
                        ),
                        SizedBox(height: size.height * 0.04),
                        TextFormField(
                          controller: _pass,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String val){
                            if (val.isEmpty){
                              return "This field is required.";
                            }else if( val.length < 6 || val.length > 20){
                              return "Password Length Should be Between 6 and 20 Characters";
                            }
                            return null;
                          },
                          obscureText: _obscurePass,
                          decoration: InputDecoration(labelText: "Password",

                              suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye),

                                onPressed: _togglePass,

                              ),

                              border: OutlineInputBorder()),
                        ),

                        SizedBox(height: size.height * 0.04),
                        TextFormField(

                          controller: _confirmPass,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String val){
                            if (val.isEmpty){
                              return "This field is required.";
                            }else if( val !=_pass.text){
                              return "Password doesn't match";
                            }
                            return null;
                          },
                          obscureText: _obscureConfirmPass,
                          decoration: InputDecoration(labelText: "Confirm Password",

                              suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye),

                                onPressed: _toggleConfirmPass,

                              ),


                              border: OutlineInputBorder()),
                        ),

                        SizedBox(height: size.height * 0.04),
                        RaisedButton.icon(

                          elevation: 3.0,
                          onPressed: (){

                            if(_validate() == true){


                              signup();
                            }else{


                              //_validate();
                            }






                          },
                          shape: RoundedRectangleBorder(

                              borderRadius: BorderRadius.all(Radius.circular(18.0))),
                          label: Text('Sign Up With Email',
                            style: ButtonTextStyle,),
                          icon: Icon(Icons.email_outlined, color:Colors.white,),
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
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 500),
                                      child: LoginScreen()));
                            },
                            child: Text(
                              "Already Have an Account?",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'ss',
                                  decoration: TextDecoration.underline
                              ),
                            )
                        ),



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
