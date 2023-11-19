import 'package:flutter/material.dart';
import 'package:todoapp/Screens/auth_page.dart';

// import 'package:intershipapp/screen/login.dart';
//
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: screenHeight * 0.52,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(42),
                    bottomRight: Radius.circular(42),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff946CC3).withOpacity(0.45),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.1),
                    Image.asset(
                      '',
                      height: screenHeight * 0.4,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.07),
              Text(
                "Welcome to ",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.08,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.02),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "TO",
                      style: TextStyle(
                        color: Color(0xff946CC3),
                        fontSize: screenWidth * 0.1,
                        fontFamily: 'Azonix',
                      ),
                    ),
                    TextSpan(
                      text: "DO",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: screenWidth * 0.1,
                        fontFamily: 'Azonix',
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.07),
              Container(
                height: screenHeight * 0.015,
                width: screenWidth * 0.6,
                decoration: BoxDecoration(
                  color: Color(0xff946CC3).withOpacity(0.79),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              SizedBox(
                height: screenHeight * 0.09,
                width: screenWidth * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AuthPage()),
                    );
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff946CC3),
                    onPrimary: Colors.white,
                    onSurface: Colors.grey,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
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
