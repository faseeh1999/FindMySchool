import 'package:FindMySchool/screens/login.dart';
import 'package:FindMySchool/screens/welcome.dart';
import 'package:FindMySchool/theme/colors.dart';
import 'package:FindMySchool/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:page_transition/page_transition.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreen> {


  GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  bool _validate() {

    return _form.currentState.validate();
  }




  final validateName = ValidationBuilder().required().minLength(6).maxLength(30).build();
  final validatePhone = ValidationBuilder().required().phone().maxLength(11).minLength(11).build();
  final validateEmail = ValidationBuilder().required().email().maxLength(50).build();
  final validatePassword = ValidationBuilder().required().minLength(6).maxLength(20).build();
  final validateConfirmPassword = ValidationBuilder().required("hello").build();









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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
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

                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validateName,
                        decoration: InputDecoration(labelText: "Name", border: OutlineInputBorder()),
                      ),
                      SizedBox(height: size.height * 0.04),
                      TextFormField(

                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validateEmail,
                        decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                      ),
                      SizedBox(height: size.height * 0.04),
                      TextFormField(

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
                        obscureText: true,
                        decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
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
                        obscureText: true,
                        decoration: InputDecoration(labelText: "Confirm Password", border: OutlineInputBorder()),
                      ),

                      SizedBox(height: size.height * 0.04),
                      RaisedButton.icon(

                        elevation: 3.0,
                        onPressed: (){

                          if(_validate() == true){
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 500),
                                    child: SignUpScreen()));
                          }else{
                            _validate();
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
    );
  }
}
