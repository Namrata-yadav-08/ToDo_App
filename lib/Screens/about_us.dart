import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.only(top: 22), // Adjust padding as needed
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ), // Replace with your icon
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        title: Center(
            child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  'About us',
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ))),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our Team',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Developers: Daiwik saxena,'
              ' Namrata Yadav,'
              'Vidhi Gupta,'
              'Designer: Nitish Kumar',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'github: vidhigupta17/todoAPP',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
