import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailtext = TextEditingController();
  @override
  void dispose() {
    emailtext.dispose();
    super.dispose();
  }

  Future passwordreset() async {
    try {
      var methods = await FirebaseAuth.instance
          .fetchSignInMethodsForEmail(emailtext.text.toLowerCase());
      print("Sign-in methods: $methods");
      if (methods.isNotEmpty) {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailtext.text.trim());
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                    'Password reset email sent to ${emailtext.text.trim()}'),
              );
            });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('This email is not registered.'),
              );
            });
      }
      //   await FirebaseAuth.instance
      //       .sendPasswordResetEmail(email: emailtext.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Enter your Email and we will send you a password reset link',
                textAlign: TextAlign.center,
                style: GoogleFonts.splash(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.all(15),
                child: TextField(
                  keyboardType: TextInputType.name,
                  controller: emailtext,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(196, 196, 196, 0.2),
                    filled: true,
                    hintText: "Enter Your Username",
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: const Icon(Icons.mail),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                passwordreset();
              },
              child: Text('Reset Password'),
              color: Colors.black,
            )
          ],
        ));
  }
}
