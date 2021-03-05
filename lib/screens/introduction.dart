import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:page_transition/page_transition.dart';

class Introduction extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Image.asset('assets/images/is1.png'),
          title: "Find the best Schools",
          body:
              "Enable Yourself to find the best possible school in all over Lahore",
          footer: Text("@Find My School App"),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
                fontFamily: 'ss', fontWeight: FontWeight.bold, fontSize: 25),
            bodyTextStyle: TextStyle(fontFamily: 'ss'),
          )),
      PageViewModel(
          image: Image.asset('assets/images/is2.png'),
          title: "Find the best Schools",
          body:
              "Enable Yourself to find the best possible school in all over Lahore",
          footer: Text(
            "@Find My School App",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
                fontFamily: 'ss', fontWeight: FontWeight.bold, fontSize: 25),
            bodyTextStyle: TextStyle(fontFamily: 'ss'),
          )),
      PageViewModel(
          image: Image.asset('assets/images/is3.png'),
          title: "Find the best Schools",
          body:
              "Enable Yourself to find the best possible school in all over Lahore",
          footer: Text("@Find My School App"),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
                fontFamily: 'ss', fontWeight: FontWeight.bold, fontSize: 25),
            bodyTextStyle: TextStyle(fontFamily: 'ss'),
          ))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: IntroductionScreen(
          done: Text(
            "Get Started",
            style: TextStyle(fontFamily: 'ss', fontSize: 15),
          ),
          onDone: () {
            // Within the `FirstRoute` widget

            Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 500),
                    child: Introduction()));
          },
          pages: getPages(),
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: TextStyle(fontFamily: 'ss', fontSize: 15),
          ),
        ),
      ),
    );
  }
}
