import 'package:FindMySchool/theme/appbar.dart';
import 'package:FindMySchool/theme/text.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'login.dart';

class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int _currentIndex = 0;
  PageController _pageController;

  List listOfColors = [
    Container(
      color: Colors.red,

    ),
    Container(
      color: Colors.blueAccent,

    ),
    Container(
      color: Colors.amber,

    ),
    Container(
      color: Colors.green,

    ),
    Container(
      color: Colors.brown,
      child: Center(
        child: FlatButton(
          child: Text("Logout"),
          textColor: Colors.white,
        ),
      ),


    ),
  ];



  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            onPressed: ()  {


              Widget LogoutButton = FlatButton(
                child: Text("Logout"),
                onPressed: () async{

                  try {
                    await FirebaseAuth.instance.signOut();
                  } catch (e) {
                    print(e);
                  }
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 500),
                          child: LoginScreen()),
                          (route) => false);



                },
              );




              Widget CancelButton = FlatButton(
                child: Text("No"),
                onPressed: () => Navigator.of(context).pop(),
              );







              // set up the AlertDialog
              AlertDialog alert = AlertDialog(
                title: Text("Confirm Logout"),
                content: Text("Are you sure you want to Logout?"),
                actions: [

                  CancelButton,
                  LogoutButton,


                ],
              );
              // show the dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );






            },
          )
        ],

        leading: Icon(Icons.menu_sharp, color: Colors.black,),

        elevation: 0.0,

        title: Text("Home", style: appBarTitle,),
        centerTitle: true,

      ),
       bottomNavigationBar: buildBottomNavyBar(),

       body: listOfColors[_currentIndex]
      );

  }

  BottomNavyBar buildBottomNavyBar() {
    return BottomNavyBar(
      selectedIndex: _currentIndex,
      showElevation: true, // use this to remove appBar's elevation
      onItemSelected: (index) => setState(() {
        _currentIndex = index;
        // _pageController.animateToPage(index,
        //     duration: Duration(milliseconds: 300), curve: Curves.ease);
      }),
       curve: Curves.easeIn,


       items: <BottomNavyBarItem>[
         BottomNavyBarItem(
           textAlign: TextAlign.justify,
             icon: Icon(Icons.search),
             title: Text("Search", style: TextStyle(fontFamily: 'ss'),),
           activeColor: Colors.red,
           inactiveColor: Colors.grey,

         ),
         BottomNavyBarItem(
            textAlign: TextAlign.justify,
             icon: Icon(Icons.star_border_outlined),
             title: Text("Bookmarks", style: TextStyle(fontFamily: 'ss'),),
           activeColor: Colors.blueAccent,
           inactiveColor: Colors.grey,
         ),
         BottomNavyBarItem(
           textAlign: TextAlign.justify,
           icon: Icon(Icons.home_sharp),
           title: Text("Home", style: TextStyle(fontFamily: 'ss'),),
           activeColor: Colors.amber,
           inactiveColor: Colors.grey,
         ),
         BottomNavyBarItem(
           textAlign: TextAlign.justify,
           icon: Icon(Icons.notifications_active),
           title: Text("Notifications", style: TextStyle(fontFamily: 'ss'),),
           activeColor: Colors.green,
           inactiveColor: Colors.grey,
         ),
         BottomNavyBarItem(
           textAlign: TextAlign.justify,
           icon: Icon(Icons.settings),
           title: Text("Settings", style: TextStyle(fontFamily: 'ss'),),
           activeColor: Colors.brown,
           inactiveColor: Colors.grey,
         ),
       ],
     );
  }
}
