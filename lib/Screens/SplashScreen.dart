// import 'dart:async';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todoapp/Screens/WelcomeScreen.dart';
import 'package:todoapp/Screens/auth_page.dart';
import 'package:todoapp/Screens/register.dart';

// import 'welcome_screeen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 7),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "TO",
                      style: TextStyle(
                          color: Color.fromARGB(255, 245, 69, 101),
                          fontSize: 42,
                          fontFamily: 'Azonix'),
                    ),
                    TextSpan(
                      text: "DO",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 42,
                          fontFamily: 'Azonix'),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomeScreen(),
          ));
    });
  }
}
